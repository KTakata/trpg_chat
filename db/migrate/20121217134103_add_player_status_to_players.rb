class AddPlayerStatusToPlayers < ActiveRecord::Migration
  def up
    add_column :players, :player_status, :string
  end

  def down
    remove_column :players, :player_status
  end
end
