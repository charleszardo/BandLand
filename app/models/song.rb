# == Schema Information
#
# Table name: songs
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  release_date :date
#  about        :text
#  credits      :text
#  privacy      :string(255)
#  album_id     :integer
#  band_id      :integer          not null
#  user_id      :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Song < ActiveRecord::Base
  before_save :default_values
  
  has_attached_file :image, :styles => { :standard => "200x200" }, default_url: 'Daft-Punk.jpg'
  validates_attachment_content_type(
    :image,
    :content_type => /\Aimage\/.*\Z/
  )
  
  has_attached_file :track
  do_not_validate_attachment_file_type :track
  
  # attr_accessible :title

  validates :title, :privacy, :band_id, :user_id, presence: true

  belongs_to :band
  belongs_to :user
  belongs_to :album
  
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings

  def default_values
    self.privacy ||= 'public'
  end
end
