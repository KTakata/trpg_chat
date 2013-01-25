class ChangePlayerTypeToPlayers < ActiveRecord::Migration
  def up
    change_column :players, :player_type, :string
  end

  def down
    change_column :players, :player_type, :integer
  end
end
