class RenameTSesstionIdToPlayers < ActiveRecord::Migration
  def up
    rename_column :players, :t_sesstion_id, :t_session_id
  end

  def down
    rename_column :players, :t_session_id, :t_sesstion_id
  end
end
