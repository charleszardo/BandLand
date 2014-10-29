# == Schema Information
#
# Table name: songs
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  release_date :date
#  about        :text
#  credits      :text
#  privacy      :string(255)
#  album_id     :integer
#  band_id      :integer          not null
#  user_id      :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'faker'

FactoryGirl.define do
  factory :song do |f|
    f.title { Faker::Company.bs }
    f.privacy "public"
    f.band_id 1
    f.user_id 1
  end
end
