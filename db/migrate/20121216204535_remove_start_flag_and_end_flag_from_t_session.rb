class RemoveStartFlagAndEndFlagFromTSession < ActiveRecord::Migration
  def up
    remove_column :t_sessions, :start_flag
    remove_column :t_sessions, :end_flag
  end

  def down
    add_column :t_sessions, :end_flag, :boolean
    add_column :t_sessions, :start_flag, :boolean
  end
end
