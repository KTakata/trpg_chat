class AddSizeToBattleMaps < ActiveRecord::Migration
  def up
    add_column :battle_maps, :size, :integer
  end

  def down
    remove_column :battle_maps, :size
  end
end
