module TalksHelper
  include ActiveSupport::Inflector

  def talk_class talk
    if talk['speaker']
      'speaker-name'
    else
      'schedule-table-legend'
    end
  end

  def show_talk_info talk
    if talk['speaker']
      if talk['is_keynote']
        content_tag :div do
          concat(content_tag(:div, '', class: 'schedule-keynote-badge'))
          concat(content_tag(:span, 'Keynote', class: 'schedule-keynote-legend'))
        end
      else
        content_tag :p, talk['name'], class: 'talk-name'
      end
    end
  end

  def has_talks? schedule
    schedule[1].length != 0
  end

  def show_hour schedule
    schedule[0]
  end

  def show_talk talk, counter
    content_tag :td, class: "schedule-table-row schedule-table-row__small day_#{counter}" do
      if talk
        concat(content_tag(:h2,speaker_label(talk[0]), class: 'schedule-table-legend'))
        concat(show_talk_info(talk[0]))
      else
        content_tag(:div,'')
      end
    end
  end

end
