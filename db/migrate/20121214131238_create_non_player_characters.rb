class CreateNonPlayerCharacters < ActiveRecord::Migration
  def change
    create_table :non_player_characters do |t|
      t.integer :t_session_id
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
