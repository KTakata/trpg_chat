class Player < ActiveRecord::Base
  attr_accessible :player_type, :t_session_id, :user_id, :player_status, :character_id
  belongs_to :user
  belongs_to :t_session

  def set_status(status)
    self.player_status = status
    self.save!
  end

  def set_player_no(no)
    if no.nil?
      self.player_type = nil
    else
      self.player_type = "Player #{no}"
    end
    self.save!
  end
end
