class StaticPagesController < ApplicationController
  # before_action :require_signed_in!
  before_filter :require_signed_in!, only: [:home]

  def index
  end
  
  def home
  end

end