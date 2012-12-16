class TSessionsController < ApplicationController
  def index
  end

  def new
  	@t_session = TSession.new
  end

  def show
  	@session = TSession.find(params[:id])
  end

  def create
    @t_session = TSession.new(params[:t_session])
    @t_session.create_sessions(params[:t_session], user)
    redirect_to my_page_path
  end
end
