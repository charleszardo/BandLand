class AlbumsController < ApplicationController
  before_filter :require_signed_in!, only: [:new, :create]
  before_filter(only: [:edit, :update]) { authenticate_rights!(Album.find(params[:id]).user_id) }

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    @tags = tag_params
    
    @album.user_id = current_user.id

    if @album.save
      handle_tags
      redirect_to user_url(current_user.id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end
  
  def update
    @album = Album.find(params[:id])
    @tags = tag_params
    
    if @album.update(album_params)
      handle_tags
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  private
  def album_params
    params.require(:album).permit(:name, :release_date, :about, :credits, :privacy, :band_id)
  end
  
  def tag_params
    params.require(:tag).permit(:names)
  end
  
  def handle_tags
    tags = tag_params[:names].split(",")
    tags.each do |tag|
      @tag = Tag.find_or_create_by(name: tag)
      @type = @album.class.name
      Tagging.find_or_create_by(tag_id: @tag.id, taggable_id: @album.id, taggable_type: @type)
    end
  end
end
