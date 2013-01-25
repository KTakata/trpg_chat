class ChangecolumnPlayerIdFromCharacters < ActiveRecord::Migration
  def up
    change_column :characters, :player_id, :integer
  end

  def down
    change_column :characters, :player_id, :string
  end
end
