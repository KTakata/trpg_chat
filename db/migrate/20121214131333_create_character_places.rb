class CreateCharacterPlaces < ActiveRecord::Migration
  def change
    create_table :character_places do |t|
      t.integer :battle_map_id
      t.string :character_type

      t.timestamps
    end
  end
end
