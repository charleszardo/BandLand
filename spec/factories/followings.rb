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

FactoryGirl.define do
  factory :following, :class => 'Following' do
    
  end

end
