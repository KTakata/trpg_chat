class RenamePlNumToPlayers < ActiveRecord::Migration
  def up
    rename_column :players, :player_num, :player_type
  end

  def down
    rename_column :players, :player_type, :player_num
  end
end
