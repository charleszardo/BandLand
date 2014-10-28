class SongsController < ApplicationController
  before_filter :require_signed_in!, only: [:new, :create, :edit]

  def new
    @song = Song.new
    render :new
  end

  def create
    @song = Song.new(song_params)
    @song.user_id = current_user.id
    if @song.save
      redirect_to user_url(current_user.id)
    else
      flash.now[:errors] = @song.errors.full_messages
      render :new
    end
  end

  def edit
  end

  private
  def song_params
    params.require(:song).permit(:title, :release_date, :about, :credits, :privacy, :band_id, :album_id)
  end
end
