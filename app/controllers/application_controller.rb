class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  # reverse the sign in...
  def sign_out
    @current_user = nil
    session.delete(:user_id)
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
