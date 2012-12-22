# -*- encoding : utf-8 -*-
class TSessionsController < ApplicationController
  def index
  end

  def new
    @t_session = TSession.new
  end

  def show
    @t_session = TSession.find(params[:id])
    @rsvp_players = Player.where(t_session_id: @t_session.id, player_status: "rsvp")
    @join_players = Player.where(t_session_id: @t_session.id, player_status: "join")
    @current_player = Player.find_by_user_id_and_t_session_id(@current_user.id, @t_session.id)
    @join_players_no = []
    @join_players.each do |player|
      @join_players_no < player.player_status[7..7] if player.player_status
    end
  end

  def create
    @t_session = TSession.new(params[:t_session])
    @t_session.create_sessions(params[:t_session], user)
    redirect_to my_page_path
  end

  def destroy
    @t_session = TSession.find(params[:id])
    if @t_session.players.find_by_user_id(user.id).try(:player_type) == "Game Master"
      @t_session.destroy
      redirect_to my_page_path
    else
      raise "Player can not delete session"
      redirect_to my_page_path
    end
  end

  def start_recruit
    t_session = TSession.find(params[:id])
    t_session.t_session_status = "recruit"
    t_session.save!
    redirect_to my_page_path
  end
end
