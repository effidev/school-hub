module ApplicationHelper
  # Return active if current page path = specified path
  def active_page(path)
    if current_page?(path)
      'active'
    else
      ''
    end
  end

  def user_avatar user
    if user.avatar.present?
      image_tag current_user.avatar
    else
      current_user.first_name[0,1].upcase
    end
  end
end
