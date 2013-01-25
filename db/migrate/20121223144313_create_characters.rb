class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :player_id
      t.string :chara_type
      t.string :name

      t.timestamps
    end
  end
end
