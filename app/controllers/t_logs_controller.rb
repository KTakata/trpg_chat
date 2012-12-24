# -*- encoding : utf-8 -*-
class TLogsController < ApplicationController
  before_filter :find_t_session, only: ['index', 'create', 'said_player']
  before_filter :find_current_player, only: ['index', 'said_player']

  def index
    @t_logs = TLog.where(t_session_id: params[:t_session_id])
    @t_log = TLog.new
  end

  def new
  end

  def create
    t_session = TSession.find_by_id(params[:t_session_id])
    t_session_players = t_session.players.where(player_status: 'join')
    t_session_players.each do |player|
      raise 'Can not start TSession' if player.player_type.nil?
    end
    #セッションのステータスを変更
    t_session.first_create(params[:t_session_id])
    redirect_to t_logs_path(t_session_id: t_session.id)
  end

  private

  def find_t_session
    @t_session = TSession.find_by_id(params[:t_session_id])
    raise 'Unknown TSession' unless @t_session
  end

  def find_current_player
    @current_player = Player.find_by_user_id_and_t_session_id(@current_user.id, @t_session.id)
  end
end