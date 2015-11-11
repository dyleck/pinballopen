module ApplicationHelper
  def menu_authorize(role)
    if session[:user_id]
      user = User.find(session[:user_id])
      required_role = Role.find_by_name(role)
      user.roles.each do |user_role|
        return true if user_role >= required_role
      end
    end
    return false
  end
end
