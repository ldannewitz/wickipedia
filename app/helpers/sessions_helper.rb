module SessionsHelper
  def current_user
    return unless user_signed_in?
    @_cached_user ||= User.find(session[:user_id])
  end

  def user_signed_in?
    session[:user_id] != nil
  end

  def admin_signed_in?
    user_signed_in? && current_user.admin
  end

  def redirect_unless_admin
    redirect_to request.original_url unless admin_signed_in?
  end

  def authenticate_user!
    redirect_to root_path unless current_user
  end
end
