# == Schema Information
#
# Table name: albums
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  release_date :date
#  about        :text
#  credits      :text
#  privacy      :string(255)      not null
#  band_id      :integer          not null
#  user_id      :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'faker'

FactoryGirl.define do
  factory :album do |f|
    f.name { Faker::Company.bs }
    f.privacy "public"
    f.band_id 1
    f.user_id 1
  end
end
