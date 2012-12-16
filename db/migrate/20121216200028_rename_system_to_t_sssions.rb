class RenameSystemToTSssions < ActiveRecord::Migration
  def up
    rename_column :t_sessions, :system, :system_name
  end

  def down
    rename_column :t_sessions, :system_name, :system
  end
end
