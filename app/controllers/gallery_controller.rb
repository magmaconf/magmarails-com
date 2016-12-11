class GalleryController < ApplicationController
  respond_to :js, only: :show

  def show
    photos = get_flickr_photos if params[:flickr]
    tweets = get_tweets if params[:twitter]
    @gallery_container = params[:container] || '#gallery-inner'
    @boxes = (photos.to_a + tweets.to_a).reverse
    respond_with @boxes, template: 'pages/2017/partials/gallery/show'
  end

  private
    def get_flickr_photos
      FlickrAdapter.new(params[:photo_set]).get_photos(params[:page], params[:per_page])
    end

    def get_tweets
      TwitterAdapter.new.get_tweets(params[:page], params[:per_page])
    end
end

