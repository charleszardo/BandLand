class StaticController < ApplicationController
  
  before_action :require_signed_in!, only: [:dashboard]

  def dashboard
  end
end
