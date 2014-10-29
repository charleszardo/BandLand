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

require 'rails_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  
  it "is invalid without username" do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end
  
  it "is invalid without email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end
  
  it "requires a password to be at least six characters" do
    FactoryGirl.build(:user, password: "abc").should_not be_valid
  end
  
  describe "authentication" do
    before :each do
      @user = FactoryGirl.create(:user)
      @initial_digest = @user.password_digest
      @initial_username = @user.username
      @initial_email = @user.email
      @session_token = @user.session_token
      @password = 'abcdefg'
      @invalid_password = "notavalidpassword"
      @user.password=(@password)
    end
    
    it "verifies that username is unique" do
      FactoryGirl.build(:user, username: @initial_username).should_not be_valid
    end
    
    it "verifies that email is unique" do
      FactoryGirl.build(:user, email: @initial_email).should_not be_valid
    end
  
    it "creates a password digest" do 
      @user.password_digest.should_not equal(@initial_digest)
    end

    it "finds correct password to be valid" do
      @user.valid_password?(@password).should be true
    end
    
    it "finds incorrect password to be invalid" do
      @user.valid_password?(@invalid_password).should be false
    end
    
    it "always has a session token" do
      @session_token.should_not be_nil
    end
    
    it "resets session token" do
      @user.reset_token!
      @user.session_token.should_not equal(@session_token)
    end
    
    it "finds user by credentials" do
      User.find_by_credentials(@initial_username, @password).should eq(@user)
    end
    
    it "returns nil if user is not in database" do
      User.find_by_credentials(@initial_username, @invalid_password).should_not eq(@user)
    end
    
  end
end