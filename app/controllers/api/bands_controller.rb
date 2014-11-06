class Api::BandsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :require_signed_in!, only: [:new, :create]
  before_filter(only: [:edit, :update]) { authenticate_rights!(Band.find(params[:id]).user_id) }
  
  wrap_parameters :band, include: [:name, :location, :website, :genre, :info, :image]
  
  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render json: @band
  end

  def create
    @band = Band.new(band_params)
    # @tags = tag_params
    
    @band.user_id = current_user.id
    if @band.save
      # handle_tags
      render json: @band
    else
      render json: @band.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :json => @band
  end
  
  def update
    @band = Band.find(params[:id])
    # @tags = tag_params
    
    if @band.update_attributes(band_params)
      # handle_tags
      render "api/bands/show"
    else
      render :json => @band.errors, :status => :unprocessable_entity
    end
  end

  def show
    @band = Band.find(params[:id])
    @albums = @band.albums
    @songs = @band.songs
    render :show
  end
  
  def destroy
    @band = Band.find(params[:id])
    if @band.destroy
      render "api/bands/show"
    else
      raise "DESTRUCTION ERROR"
    end
  end
  
  def myBands
    @bands = current_user.bands
    render :myBands
  end

  private
  def band_params
    params.require(:band).permit(:name, :location, :website, :genre, :info, :image)
  end
  
  # def tag_params
  #   params.require(:tag).permit(:names)
  # end
  #
  # def handle_tags
  #   tags = tag_params[:names].split(",")
  #   tags.each do |tag|
  #     @tag = Tag.find_or_create_by(name: tag)
  #     @type = @band.class.name
  #     Tagging.find_or_create_by(tag_id: @tag.id, taggable_id: @band.id, taggable_type: @type)
  #   end
  # end
end
