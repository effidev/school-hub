module ApplicationHelper
  # Return active if current page path = specified path
  def active_page(path)
    if current_page?(path)
      'active'
    else
      ''
    end
  end

  def link_to_navbar(name, route, method)
    html = '<li class="'<< active_page(route) << '">'
    html << link_to(name, route, method: method)
    html << '</li>'
    html.html_safe
  end
end
