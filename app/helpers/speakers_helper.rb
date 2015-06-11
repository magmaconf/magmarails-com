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
end
