module SpeakersHelper
  include ActiveSupport::Inflector

  def talk_link(metadata)
    if !!metadata[:link]
      link_to(metadata[:talk], metadata[:link], target: '_blank')
    else
      content_tag(:p, metadata[:talk])
    end
  end
  
  def image_name(speaker_name)
    transliterate(speaker_name).downcase.gsub(' ', '_')
  end

  def speaker_label(event_data)
    if event_data['speaker']
      event_data['speaker']['name']
    else
      event_data['name']
    end
  end

  def get_image_url(image)
    if image
      ENV['MAGMACONF_API_URL']+"/"+image
    end
  end

end
