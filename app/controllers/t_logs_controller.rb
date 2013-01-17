# -*- encoding : utf-8 -*-
class TLogsController < ApplicationController
  before_filter :create_new
  before_filter :authorize
  before_filter :find_t_session
  before_filter :find_current_player
  before_filter :find_t_logs
  before_filter :find_game_master_player
  before_filter :find_characters

  def index
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
      redirect_to t_logs_path(t_session_id: @t_session.id)
    end
  end

  def said_player
    attribute = params[:t_log]
    @t_log = TLog.new(body: params[:t_log][:body], owner_id: @current_player.id, t_session_id: params[:t_session_id], log_type: 'said', npc_chara_name: attribute[:npc_chara_name])
    @t_log.npc_chara_name = @current_player.player_type unless attribute[:npc_chara_name] #PC用
    if @t_log.save
      redirect_to t_logs_path(t_session_id: @t_session.id)
    else
      render :index, notice: 'You can not said'
    end

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
    if @t_log.save
      redirect_to t_logs_path(t_session_id: @t_session.id)
    else
      render :index, notice: 'Can not roll dice'
    end
  end

  def create_npc
    chara = Character.create(name: params[:character][:name], player_id: @gm.id)
    chara.chara_type = 'NPC'
    if chara.save
      render :index
    else
      render :index, notice: 'Can not create NPC'
    end
  end

  def set_name
    players_chara = Character.find_by_player_id(@current_player.id)
    players_chara.name = params[:character][:name]
    if players_chara.save && (not players_chara.name.nil?)
      redirect_to t_logs_path(t_session_id: @t_session.id)
    else
      render :index, notice: 'Player name set is faild!!'
    end
  end

  def character
    if @current_character.update_attributes(params[:character])
      redirect_to t_logs_path(t_session_id: @t_session.id)
    else
      render :index, notice: 'Character Sheet Upload is faild!!'
    end
  end

  def character_sheet
    @show_sheet_chara = Character.find_by_id(params[:character_id])
  end

  private
  def create_new
    @t_log = TLog.new
    @chara = Character.new
  end

  def find_t_logs
    @t_logs = TLog.where(t_session_id: params[:t_session_id]).order("created_at DESC")
    @show_logs = @t_logs.order("created_at DESC")
  end

  def find_t_session
    @t_session = TSession.find_by_id(params[:t_session_id])
    raise 'Unknown TSession' unless @t_session
  end

  def find_current_player
    @current_player = Player.find_by_user_id_and_t_session_id(@current_user.id, @t_session.id)
  end

  def find_game_master_player
    @gm = Player.find_by_t_session_id_and_player_type(@t_session.id, 'Game Master')
  end

  def find_characters
    @npc_charas = Character.where(player_id: @gm.id.to_s, chara_type: 'NPC')
    @gm_charas = Character.where(player_id: @gm.id.to_s)
    @gm_chara_names = ['Game Master']
    @gm_charas.each do |gm_chara|
      @gm_chara_names << gm_chara.name if gm_chara.name
    end
    @gm_charas.shift
    players = Player.where(t_session_id: @t_session.id)
    players.shift
    @player_chars = []
    players.each do |player|
      @player_chars << player.character
    end
    unless @current_player.player_type == 'Game Master'
      @current_character = Character.find_by_player_id(@current_player.id)
    end
  end
end