class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in_user
    redirect_to sign_in_url, notice: "Please sign in." unless !current_user.nil?
  end
  helper_method :current_user
end
