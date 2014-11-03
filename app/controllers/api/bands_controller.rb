class Api::BandsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :require_signed_in!, only: [:new, :create]
  before_filter(only: [:edit, :update]) { authenticate_rights!(Band.find(params[:id]).user_id) }
  
  def index
    @bands = Band.all
    render :json => @bands
  end

  def new
    @band = Band.new
    render :json => @band
  end

  def create
    @band = Band.new(band_params)
    # @tags = tag_params
    
    @band.user_id = current_user.id
    if @band.save
      # handle_tags
      render :json => @band
    else
      render :json => @band.errors, :status => :unprocessable_entity
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :json => @band
  end
  
  def update
    @band = Band.find(params[:id])
    # @tags = tag_params
    
    if @band.update(band_params)
      # handle_tags
      render :json => @band
    else
      render :json => @band.errors, :status => :unprocessable_entity
    end
  end

  def show
    @band = Band.find(params[:id])
    render :json => @band
  end

  private
  def band_params
    params.require(:band).permit(:name, :location, :website, :genre, :info)
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
