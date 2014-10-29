# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  location   :string(255)
#  website    :string(255)
#  genre      :string(255)
#  info       :text
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#


require 'faker'

FactoryGirl.define do
  factory :band do |f|
    f.name { Faker::Company.bs }
    f.user_id 1
    f.genre 'Experimental'
  end
end
