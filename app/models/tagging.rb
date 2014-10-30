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
end
