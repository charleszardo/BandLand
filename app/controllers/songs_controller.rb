class SongsController < ApplicationController
  before_filter :require_signed_in!, only: [:new, :create, :edit]

  def new
    @song = Song.new
    render :new
  end

  def create
    @song = Song.new(song_params)
    @tags = tag_params
    
    @song.user_id = current_user.id
    if @song.save
      handle_tags
      redirect_to user_url(current_user.id)
    else
      flash.now[:errors] = @song.errors.full_messages
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
    render :edit
  end
  
  def update
    @song = Song.find(params[:id])
    @tags = tag_params
    
    if @song.update(song_params)
      handle_tags
      redirect_to song_url(@song)
    else
      flash.now[:errors] = @song.errors.full_messages
      render :edit
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  private
  def song_params
    params.require(:song).permit(:title, :release_date, :about, :credits, :privacy, :band_id, :album_id)
  end
  
  def tag_params
    params.require(:tag).permit(:names)
  end
  
  def handle_tags
    tags = tag_params[:names].split(",")
    tags.each do |tag|
      @tag = Tag.find_or_create_by(name: tag)
      @type = @song.class.name
      Tagging.find_or_create_by(tag_id: @tag.id, taggable_id: @song.id, taggable_type: @type)
    end
  end
end
