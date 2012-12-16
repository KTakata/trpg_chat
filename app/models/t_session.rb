class TSession < ActiveRecord::Base
  attr_accessible :end_flag, :start_flag, :system_name, :scenario_name
  has_many :players
  has_many :users, through: :players

  validates :system_name, presence: true
  validates :scenario_name, presence: true

  def create_sessions(attribute, current_user)
    current_player = Player.new(user_id: current_user.id)
    transaction do
      self.start_flag = false
      self.end_flag = false
      self.save!
      current_player.t_session_id = self.id
      current_player.player_type = "Game Master"
      current_player.save!
    end
    rescue => e
    flash[:error] = "Can not create trpg session"
    redirect_to new_t_session_path
  end
end
