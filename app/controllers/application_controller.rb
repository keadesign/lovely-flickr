class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def require_current_user
    set_current_user
    flash[:error] = "You must be signed in to do this!"
    redirect_to new_session_path unless @current_user
  end

  # def check_user_login
  #   if session[:user_id]
  #     @current_user = User.find(session[:user_id])
  #   else
  #     redirect_to login_path
  #   end

end
