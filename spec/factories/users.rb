# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  location        :string(255)
#  bio             :text
#  created_at      :datetime
#  updated_at      :datetime
#  email           :string(255)      not null
#

require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.username { Faker::Name.first_name }
    f.email "test@test.com"
    f.password_digest 123456
    f.password "abcdefg"
  end
end
