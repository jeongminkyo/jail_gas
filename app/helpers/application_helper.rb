module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"   # Green
      when "error"
        "alert-danger"    # Red
      when "alert"
        "alert-warning"   # Yellow
      when "notice"
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end

  def user_roles(user)
    user.roles.map(&:name).join(',').titleize
  end

  def user_is_admin?(user)
    find_user = User.find_by_id(user.id)
    find_user.is_admin?
  end
end
