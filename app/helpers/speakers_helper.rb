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

  def render_speaker_class bio 
    'no-bio' if bio.length == 0
  end

  def get_image_url(image)
    if image
      ENV['MAGMACONF_S3_URL']+"/"+image
    end
  end
  
  def show_text_see_more bio
    if bio.length > 0
      content_tag :a, 'See bio >', class: 'more'
    end
  end
  
  def class_name name
    "short" if name.length>20
  end

  def speaker_mask_url(speaker)
    if speaker['mask_image']['url']
      speaker['mask_image']['url']
    else
      speaker['image_field']['url']
    end
  end
end
