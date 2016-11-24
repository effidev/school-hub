module AccountHelper
  def link_to_active_menu(name, route, method)
    if current_page?(route)
      chevron = '<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> '.html_safe
      html = '<div class="active">'
      html << link_to(chevron << name, route, method: method)
      html << '</div>'
    else
      html = link_to(name, route, method: method)
    end

    html.html_safe
  end
end
