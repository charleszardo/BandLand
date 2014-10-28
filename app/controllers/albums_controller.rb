class AlbumsController < ApplicationController
  before_filter :require_signed_in!, only: [:new, :create, :edit]

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    if @album.save
      redirect_to user_url(current_user.id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def show
  end

  private
  def album_params
    params.require(:album).permit(:name, :release_date, :about, :credits, :privacy, :band_id)
  end
end
