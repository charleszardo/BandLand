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

require 'rails_helper'

describe Album do
  it "has a valid factory" do
    FactoryGirl.create(:album).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:album, name: nil).should_not be_valid
  end
  
  it "is invalid without a privacy setting" do
    FactoryGirl.build(:album, privacy: nil).should_not be_valid
  end
  
  it "is invalid without a user" do
    FactoryGirl.build(:album, user_id: nil).should_not be_valid
  end
  
  it "is invalid without a band" do
    FactoryGirl.build(:album, band_id: nil).should_not be_valid
  end
end
