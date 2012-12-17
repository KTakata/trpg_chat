class ApplicationController < ActionController::Base
  before_filter :find_current_user
  def user
    if session[:user_id]
      user = User.find(session[:user_id])
    end
  end

  def authorize
    if user.nil?
      redirect_to login_url
    end
  end

  private
  def find_current_user
    @current_user = user if user
  end
end
