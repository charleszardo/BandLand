class Album < ActiveRecord::Base
  before_save :default_values

  validates :name, :privacy, :band_id, :user_id, presence: true

  belongs_to :band
  belongs_to :user
  has_many :songs

  def default_values
    self.privacy ||= 'public'
  end
end
