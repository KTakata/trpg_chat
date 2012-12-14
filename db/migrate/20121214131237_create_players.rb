class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id
      t.integer :t_sesstion_id
      t.integer :player_num

      t.timestamps
    end
  end
end
