class ApplicationController < ActionController::Base
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
end
