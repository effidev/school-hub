module ApplicationHelper
  # Return active if current page path = specified path
  def active_page(path)
    if current_page?(path)
      'active'
    else
      ''
    end
  end
end
