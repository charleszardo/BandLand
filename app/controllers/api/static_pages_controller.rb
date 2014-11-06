class Api::StaticPagesController < ApplicationController
  # before_action :require_signed_in!

  def index
    render "api/static_pages/index"
  end

end