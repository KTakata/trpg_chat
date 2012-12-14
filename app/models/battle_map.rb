class BattleMap < ActiveRecord::Base
  attr_accessible :name, :size_h, :size_w, :t_session_id
end
