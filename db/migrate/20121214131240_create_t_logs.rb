class CreateTLogs < ActiveRecord::Migration
  def change
    create_table :t_logs do |t|
      t.string :body
      t.integer :owner_id

      t.timestamps
    end
  end
end
