class MyPageController < ApplicationController
before_filter :authorize
  def index
    @current_user = user
    @new_sessions = user.t_sessions.where(t_session_status: "new")
    @recruitment_sessions = user.t_sessions.where(t_session_status: "recruit")
    @progress_sessions = user.t_sessions.where(t_session_status: "progress")
    @closed_sessions = user.t_sessions.where(t_session_status: "end")
  end
end
