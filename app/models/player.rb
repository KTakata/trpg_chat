class Player < ActiveRecord::Base
  attr_accessible :player_type, :t_session_id, :user_id, :player_status
  belongs_to :user
  belongs_to :t_session
end
