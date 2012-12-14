class MyPageController < ApplicationController
before_filter :authorize
  def index
    @t_sessions = user.t_sessions
    @current_user = user
  end
end
