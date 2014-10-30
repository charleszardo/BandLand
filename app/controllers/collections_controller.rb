class CollectionsController < ApplicationController

  def create
    @collection = Collection.new(collection_params)
    @collection.save
    redirect_to request.referer
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to request.referer
  end
  
  private
  def collection_params
    params.require(:collection).permit(:user_id, :album_id)
  end
  
end