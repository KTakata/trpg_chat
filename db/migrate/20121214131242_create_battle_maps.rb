class CreateBattleMaps < ActiveRecord::Migration
  def change
    create_table :battle_maps do |t|
      t.integer :t_session_id
      t.integer :size_h
      t.integer :size_w
      t.string :name

      t.timestamps
    end
  end
end
