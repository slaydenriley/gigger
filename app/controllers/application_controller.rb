class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  rescue_from CanCan::AccessDenied, with: :deny_access
  before_action :set_time_zone, if: :logged_in?

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    if !logged_in?
      flash[:alert] = "You must be logged in to view this page! Please login or create an account"
      redirect_to root_path
    end
  end

  def deny_access
    flash[:denied] = "You are not authorized to do that!"
    redirect_back(fallback_location: root_path)
  end

  def set_time_zone
    Time.zone
  end

end
