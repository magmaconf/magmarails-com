class FlickrPhoto
  attr_reader :title, :description, :url

  def initialize(attrs = {})
    @title = attrs.fetch(:title, 'Unknown')
    @description = attrs.fetch(:description, 'Unknown')
    @url = attrs.fetch(:url, '#')
    @thumbnail = attrs.fetch(:thumbnail, '#')
  end
end

class FlickrAdapter
  def initialize
    @user_id = '39311369@N07'
    @api_key = FlickRaw.api_key
    @secret = FlickRaw.shared_secret
  end

  def get_photos(page = 1, per_page = 10)
    public_photos = get_user_photos(page, per_page)

    public_photos.each_with_object([]) do |photo, photos|
      photos << FlickrPhoto.new({
        title: photo.title,
        description: photo.description,
        url: photo.url_l,
        thumbnail: photo.url_t
      })
    end

  end

  def get_user_photos(page, per_page)
    flickr.people.getPublicPhotos(
        {
          api_key: @api_key,
          user_id: @user_id,
          page: page,
          per_page: per_page,
          extras: 'description, url_t, url_l'
        })
  end
end
