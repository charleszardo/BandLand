class BandsController < ApplicationController
  before_filter :require_signed_in!, only: [:new, :create, :edit]

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    @band.user_id = current_user.id
    if @band.save
      redirect_to user_url(current_user.id)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
  end

  private
  def band_params
    params.require(:band).permit(:name, :location, :website, :genre, :info)
  end
end
