# -*- encoding : utf-8 -*-
class TSession < ActiveRecord::Base
  attr_accessible :t_session_status, :system_name, :scenario_name
  has_many :players
  has_many :users, through: :players

  validates :system_name, presence: true
  validates :scenario_name, presence: true

  def create_sessions(attribute, current_user)
    current_player = Player.new(user_id: current_user.id)
    transaction do
      self.t_session_status = "new"
      self.save!
      current_player.t_session_id = self.id
      current_player.player_type = "Game Master"
      current_player.player_status = "join"
      current_player.save!
    end
    rescue => e
    flash[:error] = "Can not create trpg session" #TODO:flash実装
    redirect_to new_t_session_path
  end

  def first_create(attribute)
    transaction do
      self.t_session_status = "progress"
      self.save!
      t_log = TLog.new(t_session_id: attribute, body: 'セッションを開始しました')
      t_log.save!
      players.where(player_status: 'join').order(:player_type).each_with_index do |player, no|
        player.character_id = no
        Character.create!(player_id: player.id, chara_type: 'Player Character')
        player.save!
      end

    end
    rescue => e
    flash[:error] = "Can not start trpg session" #TODO:flash実装
    redirect_to t_session_path(self.id)
  end
end
