# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.find_by_email(params[:email])
      if user.password == params[:password]
        session[:user_id] = user.id
        redirect_to my_page_path
      end
    else
      redirect_to login_url, notice: "Invalid!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out!"
  end
end