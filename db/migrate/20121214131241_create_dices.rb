class CreateDices < ActiveRecord::Migration
  def change
    create_table :dices do |t|
      t.integer :t_log_id
      t.integer :score

      t.timestamps
    end
  end
end
