# -*- encoding : utf-8 -*-
class BattleMapsController < TLogsController
  before_filter :find_current_map
  def show
    
  end

  private
  def find_current_map
    @map = BattleMap.find_by_id_and_t_session_id(params[:id],params[:t_session_id])
    raise "this map is unknown map" unless @map
    @h_count = 1
    @w_count = 1
  end 
end