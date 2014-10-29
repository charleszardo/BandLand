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

require 'rails_helper'

describe Band do
  it "has a valid factory" do
    FactoryGirl.create(:band).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:band, name: nil).should_not be_valid
  end
  
  it "is invalid without a user" do
    FactoryGirl.build(:band, user_id: nil).should_not be_valid
  end
  
  it "is invalid without a genre" do
    FactoryGirl.build(:band, genre: nil).should_not be_valid
  end
  
  it "does not allow an invalid genre" do
    FactoryGirl.build(:band, genre: "not a real genre").should_not be_valid
  end
  
  it "verifies name uniqueness" do
    @band = FactoryGirl.create(:band)
    band_name = @band.name
    FactoryGirl.build(:band, name: band_name).should_not be_valid
  end
end