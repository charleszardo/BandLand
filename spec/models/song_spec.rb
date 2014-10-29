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

require 'rails_helper'

describe Song do
  it "has a valid factory" do
    FactoryGirl.create(:song).should be_valid
  end
  
  it "is invalid without a title" do
    FactoryGirl.build(:song, title: nil).should_not be_valid
  end
  
  it "is invalid without a privacy setting" do
    FactoryGirl.build(:song, privacy: nil).should_not be_valid
  end
  
  it "is invalid without a user" do
    FactoryGirl.build(:song, user_id: nil).should_not be_valid
  end
  
  it "is invalid without a band" do
    FactoryGirl.build(:song, band_id: nil).should_not be_valid
  end
end