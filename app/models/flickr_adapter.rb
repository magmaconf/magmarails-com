class FlickrPhoto
  attr_reader :id, :title, :description, :url, :thumbnail, :type

  def initialize(attrs = {})
    @id = attrs.fetch(:id, 'Unknown');
    @title = attrs.fetch(:title, 'Unknown')
    @description = attrs.fetch(:description, 'Unknown')
    @url = attrs.fetch(:url, '#')
    @thumbnail = attrs.fetch(:thumbnail, '#')
    @type = attrs.fetch(:type, 'photo')
  end
end

class FlickrAdapter
  def initialize
    @user_id = '63319310@N04'
    @api_key = FlickRaw.api_key
    @secret = FlickRaw.shared_secret
    @photoset = '72157645528624066'
  end

  def get_photos(page = 1, per_page = 10)
    public_photos = get_user_photos(page, per_page)

    public_photos.each_with_object([]) do |photo, photos|
      photos << FlickrPhoto.new({
        id: photo.id,
        title: photo.title,
        description: photo.description,
        url: photo.url_l,
        thumbnail: photo.url_m,
        type: photo_type(photo)
      })
    end

  end

  def photos_left?(page, per_page)
    (page.to_i * per_page.to_i) < total_photos
  end

  def total_photos
    @total_photos ||= flickr.photosets.getInfo(photoset_id: @photoset).photos
  end

  def photo_type(photo)
    konstantin_photo?(photo)  ? 'konstantin_photo' : 'photo'
  end

  def konstantin_photo?(photo)
    photo.tags.include?('konstantin') || (photo.description =~ /Photo by Konstantin Hasse/)
  end

  def get_user_photos(page, per_page)
    photoset = []

    if photos_left?(page, per_page)

      photoset = flickr.photosets.getPhotos(
          {
            api_key: @api_key,
            user_id: @user_id,
            photoset_id: @photoset,
            page: page,
            per_page: per_page,
            extras: 'description, url_m, url_l, tags'
          })

      @total_photos = photoset.total
      photoset = photoset.photo
    end

   photoset
  end
end
