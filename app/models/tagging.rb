# == Schema Information
#
# Table name: taggings
#
#  id            :integer          not null, primary key
#  tag_id        :integer
#  taggable_id   :integer
#  taggable_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Tagging < ActiveRecord::Base
  validates :tag_id, :taggable_id, :taggable_type, presence: true
  
  belongs_to :taggable, :polymorphic => true
  belongs_to :tag
  
  # can probably remove
  def self.create_tagging(tag, taggable, type)
    tagging = Tagging.new({tag_id: tag.id, taggable_id: taggable.id, taggable_type: type})
    tagging.save
  end
  
end
