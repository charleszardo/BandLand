class Api::SongsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :require_signed_in!, only: [:new, :create]
  before_filter(only: [:edit, :update]) { authenticate_rights!(Song.find(params[:id]).user_id) }
  
  def index
    @songs = Song.all
    render "api/songs/index"
  end

  def new
    @song = Song.new
    render :json => @song
  end

  def create
    @song = Song.new(song_params)
    # @tags = tag_params
    
    @song.user_id = current_user.id
    if @song.save
      # handle_tags
      render "api/songs/show"
    else
      render :json => @song.errors, :status => :unprocessable_entity
    end
  end

  def edit
    @song = Song.find(params[:id])
    render :json => @song
  end
  
  def update
    @song = Song.find(params[:id])
    # @tags = tag_params
    
    if @song.update_attributes(song_params)
      # handle_tags
      render "api/songs/show"
    else
      render :json => @song.errors, :status => :unprocessable_entity
    end
  end

  def show
    @song = Song.find(params[:id])
    render "api/songs/show"
  end
  
  def destroy
    @song = Song.find(params[:id])
    @song.destroy!
    render "api/songs/show"
  end

  private
  def song_params
    params.require(:song).permit(:title, :release_date, :about, :credits, :privacy, :band_id, :album_id)
  end

  # def tag_params
  #   params.require(:tag).permit(:names)
  # end
  #
  # def handle_tags
  #   tags = tag_params[:names].split(",")
  #   tags.each do |tag|
  #     @tag = Tag.find_or_create_by(name: tag)
  #     @type = @song.class.name
  #     Tagging.find_or_create_by(tag_id: @tag.id, taggable_id: @song.id, taggable_type: @type)
  #   end
  # end
end
