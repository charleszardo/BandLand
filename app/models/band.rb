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
  GENRES = %w(Acoustic Alternative Ambient Blues Classical Comedy Country Devotional Electronic Experimental Folk Funk Hip-Hop/Rap Jazz Kids Latin Metal Pop Punk R&B/Soul Reggae Rock Soundtrack Spoken Word World)

  belongs_to :user
  has_many :albums, :dependent => :destroy
  has_many :songs, :dependent => :destroy
  
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings

  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true, inclusion: GENRES
  validates :user_id, presence: true

end
