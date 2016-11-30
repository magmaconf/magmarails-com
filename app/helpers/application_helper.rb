module ApplicationHelper
  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end

  def find_cfp_partial_view id
    if id == 'sponsors'
      'pages/2017/partials/asides/sponsors_info'
    else
      'pages/2017/partials/welcome'
    end
  end

  def render_reylero_img id
    case id
    when 'sponsors'
      image_tag('2017/reylero_sponsors.svg', class: 'reylero-sponsor')
    when 'speakers'
      image_tag('2017/godin.png', class: 'reylero-godinez')
    when 'talks'
      image_tag('2017/quetzal.png', class: 'reylero-godinez')
    when 'getting'
      image_tag('2017/pirata.png', class: 'reylero-pirata')
    when 'ready_to_evolve'
      image_tag('2017/futuro_auto.svg', class: 'reylero-macfly')
    else
      image_tag('2017/reyleros_selfie.svg', class: 'reylero-selfie')
    end
  end

  def render_class_name id
    if id == 'talks' || id == 'getting' || id == 'speakers'
      ''
    elsif id == 'ready_to_evolve'
      'more'
    else
      'less'
    end
  end
end
