class CreateGms < ActiveRecord::Migration
  def change
    create_table :gms do |t|
      t.integer :user_id
      t.integer :t_sesstion_id

      t.timestamps
    end
  end
end
