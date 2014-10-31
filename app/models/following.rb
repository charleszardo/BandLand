# == Schema Information
#
# Table name: followings
#
#  id            :integer          not null, primary key
#  follower_id   :integer
#  followed_id   :integer
#  followed_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Following < ActiveRecord::Base
  validates :follower_id, :followed_id, :followed_type, presence: true
  
  belongs_to :followed, :polymorphic => true
  belongs_to :follower, class_name: "User"
end
