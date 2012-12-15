class MyPageController < ApplicationController
before_filter :authorize
  def index
    @current_user = user
    @open_sessions = user.t_sessions.where(end_flag: false)
    @closed_sessions = user.t_sessions.where(end_flag: true)
  end
end
