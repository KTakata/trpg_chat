class AddCharacterIdToPlayers < ActiveRecord::Migration
  def up
    add_column :players, :character_id, :integer
  end

  def down
    remove_column :players, :character_id
  end
end
