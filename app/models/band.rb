class Band < ActiveRecord::Base
  GENRES = %w(Acoustic Alternative Ambient Blues Classical Comedy Country Devotional Electronic Experimental Folk Funk Hip-Hop/Rap Jazz Kids Latin Metal Pop Punk R&B/Soul Reggae Rock Soundtrack Spoken Word World)

  belongs_to :user
  has_many :albums
  has_many :songs

  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true, inclusion: GENRES
  validates :user_id, presence: true

end
