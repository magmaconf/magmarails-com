module SpeakersHelper
  def talk_link(metadata)
    if !!metadata[:link]
      link_to(metadata[:talk], metadata[:link], target: '_blank')
    else
      content_tag(:p, metadata[:talk])
    end
  end
end
