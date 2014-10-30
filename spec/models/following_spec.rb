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

require 'rails_helper'

RSpec.describe Following, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
