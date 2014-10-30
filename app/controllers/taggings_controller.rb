class TaggingsController < ApplicationController

  def destroy
    fail
    @tagging = Tagging.find(params[:id].to_i)
    # tagged_type = @tagging.taggable_type
    # tagged_id = @tagging.taggable_id
    # redirect_url = tagged_type
    @tagging.destroy
    # redirect_to bands_url
    redirect_to request.referer
  end
  
end