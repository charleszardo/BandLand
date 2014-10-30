class TaggingsController < ApplicationController

  def destroy
    @tagging = Tagging.find(params[:id].to_i)
    @tagging.destroy
    redirect_to request.referer
  end
  
end