# -*- encoding : utf-8 -*-
class TLogsController < ApplicationController
  def index
    @t_logs = TLog.where(t_session_id: params[:t_session_id])
  end

  def new
  end

  def create
    t_session = TSession.find_by_id(params[:t_session_id])
    t_session_players = t_session.players.where(player_status: "join")
    t_session_players.each do |player|
      raise "Can not start TSession" if player.player_type.nil?
    end
    #セッションのステータスを変更
    t_session.first_create(params[:t_session_id])
    redirect_to t_logs_path(t_session_id: params[:t_session_id])
  end

end