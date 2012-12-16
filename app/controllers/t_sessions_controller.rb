class TSessionsController < ApplicationController
  def index
  end

  def new
  	@t_session = TSession.new
  end

  def show
    @t_session = TSession.find(params[:id])
    @players = Player.where(t_session_id: @t_session.id)
  end

  def create
    @t_session = TSession.new(params[:t_session])
    @t_session.create_sessions(params[:t_session], user)
    redirect_to my_page_path
  end
end
