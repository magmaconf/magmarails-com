module ApplicationHelper
  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end

  def find_cfp_partial_view id
    if id == 'sponsors'
      "pages/2017/partials/asides/sponsors_info"
    else
      "pages/2017/partials/welcome"
    end
  end

  def render_reylero_img id
    if id == 'sponsors'
      image_tag('2017/reylero_sponsors.svg', class: 'reylero-sponsor')
    else
      image_tag('2017/reyleros_selfie.svg', class: 'reylero-selfie')
    end
  end
end
