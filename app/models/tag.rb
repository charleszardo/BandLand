# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  has_many :taggings, :dependent => :destroy
  has_many :bands, :through => :taggings, :source => :taggable, :source_type => 'Band'
  has_many :albums, :through => :taggings, :source => :taggable, :source_type => 'Album'
  has_many :songs, :through => :taggings, :source => :taggable, :source_type => 'Song'
end
