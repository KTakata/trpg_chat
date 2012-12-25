# -*- encoding : utf-8 -*-
class TLogsController < ApplicationController
  before_filter :authorize
  before_filter :find_t_session, only: ['index', 'create', 'said_player', 'dice_roll']
  before_filter :find_current_player, only: ['index', 'said_player', 'dice_roll']
  before_filter :find_t_logs

  def index
    @t_log = TLog.new
  end

  def new
  end

  def create
    t_session = TSession.find_by_id(params[:t_session_id])
    if params[:redirect] && params[:redirect] == 'to_index'
      redirect_to t_logs_path(t_session_id: t_session.id)
    else
      t_session_players = t_session.players.where(player_status: 'join')
      t_session_players.each do |player|
        raise 'Can not start TSession' if player.player_type.nil?
      end
      #セッションのステータスを変更
      t_session.first_create(params[:t_session_id])
      redirect_to t_logs_path(t_session_id: t_session.id)
    end
  end

  def said_player
    @t_log = TLog.new(body: params[:t_log][:body], owner_id: @current_player.id)
  end

  def dice_roll
    many = params[:t_log][:many].to_i
    d_type = params[:t_log][:d_type].to_i
    num = 0
    score = 0
    body = []
    #ダイスの各値と合計を計算
    while num < many do
      body << rand(d_type) + 1
      score = body.last + score
      num += 1
    end
    body = body.to_s
    @t_log = TLog.new(owner_id: @current_player.id, many: many, d_type: d_type, body: body , score: score, log_type: 'dice', t_session_id: @t_session.id)
    if  @t_log.save
      render :index
    else
      render :index, notice: 'Can not roll dice'
    end
  end

  private

  def find_t_logs
    @t_logs = TLog.where(t_session_id: params[:t_session_id])
  end

  def find_t_session
    @t_session = TSession.find_by_id(params[:t_session_id])
    raise 'Unknown TSession' unless @t_session
  end

  def find_current_player
    @current_player = Player.find_by_user_id_and_t_session_id(@current_user.id, @t_session.id)
  end
end