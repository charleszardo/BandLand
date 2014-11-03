class BandsController < ApplicationController
  before_filter :require_signed_in!, only: [:new, :create]
  before_filter(only: [:edit, :update]) { authenticate_rights!(Band.find(params[:id]).user_id) }

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    @tags = tag_params
    
    @band.user_id = current_user.id
    if @band.save
      handle_tags
      redirect_to user_url(current_user.id)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end
  
  def update
    @band = Band.find(params[:id])
    @tags = tag_params
    
    if @band.update(band_params)
      handle_tags
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  private
  def band_params
    params.require(:band).permit(:name, :location, :website, :genre, :info)
  end
  
  def tag_params
    params.require(:tag).permit(:names)
  end
  
  def handle_tags
    tags = tag_params[:names].split(",")
    tags.each do |tag|
      @tag = Tag.find_or_create_by(name: tag)
      @type = @band.class.name
      Tagging.find_or_create_by(tag_id: @tag.id, taggable_id: @band.id, taggable_type: @type)
    end
  end
end
