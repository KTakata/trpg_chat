class TSessionController < ApplicationController
  def index
  end

  def new
  end

  def show
  	@session = TSession.find(params[:id])
  end
end
