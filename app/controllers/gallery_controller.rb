class GalleryController < ApplicationController
  respond_to :js, only: :show

  def show
    @photos = FlickrAdapter.new.get_photos(params[:page], params[:per_page])
    respond_with @photos
  end
end
