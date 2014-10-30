class FollowingsController < ApplicationController

  def create
    @following = Following.new(following_params)
    @following.save
    redirect_to request.referer
  end

  def destroy
    @following = Following.find(params[:id].to_i)
    @following.destroy
    redirect_to request.referer
  end
  
  private
  def following_params
    params.require(:following).permit(:follower_id, :followed_id, :followed_type)
  end
  
end