class CreateTSessions < ActiveRecord::Migration
  def change
    create_table :t_sessions do |t|
      t.string :system
      t.boolean :start_flag
      t.boolean :end_flag

      t.timestamps
    end
  end
end
