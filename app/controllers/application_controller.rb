class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to root_path unless logged_in?
  end

end
