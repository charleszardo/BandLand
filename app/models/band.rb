# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  location   :string(255)
#  website    :string(255)
#  genre      :string(255)
#  info       :text
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Band < ActiveRecord::Base
  GENRES = %w(Acoustic Alternative Ambient Blues Chump Classical Comedy Country Devotional Dub Electronic Experimental Folk Funk Hip-Hop/Rap Jazz Kids Latin Metal Pop Psychedelic Punk R&B/Soul Reggae Rock Soundtrack Spoken Word World)

  # attr_accessible :name

  belongs_to :user
  has_many :albums, :dependent => :destroy
  has_many :songs, :dependent => :destroy
  
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  has_many :followings, :as => :followed

  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true, inclusion: GENRES
  validates :user_id, presence: true
  
  has_attached_file :image, :styles => { :standard => "200x200" }, default_url: 'Daft-Punk.jpg'
  validates_attachment_content_type(
    :image,
    :content_type => /\Aimage\/.*\Z/
  )
  
  # follower functionality
  def followers
    followings = Following.where(followed_id: self.id, followed_type: "Band")
    follower_arr = []
    followings.each do |following|
      follower_arr << User.find_by_id(following.follower_id)
    end
    follower_arr
  end
  
  def find_following(user)
    Following.find_by({ follower_id: user.id, followed_id: self.id, followed_type: "Band"})
  end

end
