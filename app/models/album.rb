# == Schema Information
#
# Table name: albums
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  release_date :date
#  about        :text
#  credits      :text
#  privacy      :string(255)      not null
#  band_id      :integer          not null
#  user_id      :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Album < ActiveRecord::Base
  # attr_accessible :name
  
  before_save :default_values

  validates :name, :privacy, :band_id, :user_id, presence: true

  belongs_to :band
  belongs_to :user
  has_many :songs
  
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  has_attached_file :image, :styles => { :standard => "200x200" }, :default_url => ActionController::Base.helpers.asset_path('record.jpeg')
  # do_not_validate_attachment_file_type :image
  validates_attachment_content_type(
    :image,
    :content_type => /\Aimage\/.*\Z/
  )

  def default_values
    self.privacy ||= 'public'
  end
  
  # Collections
  def in_users_collections
    users = []
    collections = Collection.where(album_id: self.id)
    collections.each do |collection|
      users << User.find_by_id(collection.user_id)
    end
    users
  end
end
