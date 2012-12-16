class TSessionsController < ApplicationController
  def index
  end

  def new
  	@t_session = TSession.new
  end

  def show
  	@session = TSession.find(params[:id])
  end
end
