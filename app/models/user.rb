# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  location        :string(255)
#  bio             :text
#  created_at      :datetime
#  updated_at      :datetime
#  email           :string(255)      not null
#

class User < ActiveRecord::Base
  validates :username, :password_digest, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, format: { with: /\A\S+@.+\.\S+\z/,
      message: "is invalid" }
  
  attr_reader :password

  has_many :bands, :dependent => :destroy
  has_many :albums, :dependent => :destroy
  has_many :songs, :dependent => :destroy
  
  has_many :followings, :as => :followed
  
  # has_many :followings, :dependent => :destroy
  #
  # has_many :follows, :through => :followings, :source => :followed_id, :source_type => 'User'
  # has_many :follows, :through => :followings, :source => :followed_id, :source_type => 'Band'

  after_initialize :ensure_session_token
  
  # Collections
  def collection_items
    Collection.where(user_id: self.id)
  end
  
  def collection_item_to_album(item)
    Album.find_by_id(item.album_id)
  end
  
  def collection_albums
    items = []
    self.collection_items.each do |item|
      items << Album.find_by_id(item.album_id)
    end
    items
  end
  
  # Following Functionality
  def followers
    followings = Following.where(followed_id: self.id, followed_type: "User")
    follower_arr = []
    followings.each do |following|
      follower_arr << User.find_by_id(following.follower_id)
    end
    follower_arr
  end
  
  def following_bands
    followings = Following.where(follower_id: self.id, followed_type: "Band")
    following_bands_arr = []
    followings.each do |following|
      following_bands_arr << Band.find_by_id(following.followed_id)
    end
    following_bands_arr
  end
  
  def following_users
    followings = Following.where(follower_id: self.id, followed_type: "User")
    following_users_arr = []
    followings.each do |following|
      following_users_arr << User.find_by_id(following.followed_id)
    end
    following_users_arr
  end

  def find_following(user)
    Following.find_by({ follower_id: user.id, followed_id: self.id, followed_type: "User"})
  end

  # User Authentication
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.valid_password?(password)
    user
  end
  
  def self.find_or_create_by_fb_auth_hash(auth)
    p "~~~~~~~~~~~~~~~~~~oauth_hash~~~~~~~~~~~~~~~~~~"
    p auth
    omniauth_id = auth['uid'] + auth['provider']
    user = User.find_by_omniauth_id(omniauth_id)
    return user if user

    fb_name = auth["info"].name
    fb_email = auth["info"].email
    pic = auth['info'].image + "?width=200&height=200"
    
    user = User.create!(omniauth_id: omniauth_id,
                        email: fb_email,
                        password: omniauth_id,
                        username: fb_name,
                        filepicker_url: pic)
    return user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
