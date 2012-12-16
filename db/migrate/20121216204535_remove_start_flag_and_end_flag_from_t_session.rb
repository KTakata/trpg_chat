class RemoveStartFlagAndEndFlagFromTSession < ActiveRecord::Migration
  def up
    remove_column :t_sessions, :start_flag
    remove_column :t_sessions, :end_flag
  end

  def down
    add_colmn :t_sessions, :start_flag, :boolean
    add_colmn :t_sessions, :end_flag, :boolean
  end
end
