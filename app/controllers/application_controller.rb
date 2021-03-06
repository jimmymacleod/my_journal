class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :fetch_user

  include SessionsHelper

private

  def fetch_user

    if session[:user_id].present?
      @current_user = User.find_by :id => session[:user_id]


      session[:user_id] = nil unless @current_user
    end
  end

  def authorize_user
   redirect_to root_path unless @current_user.present?
  end

  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end

end
