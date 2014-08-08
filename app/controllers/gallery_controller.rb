class GalleryController < ApplicationController
  respond_to :js, only: :show

  def show
    photos = FlickrAdapter.new.get_photos(params[:page], params[:per_page])
    tweets = TwitterAdapter.new.get_tweets(params[:page], params[:per_page])
    @boxes = (photos + tweets).shuffle
    respond_with @boxes
  end
end
