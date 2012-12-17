class AddTSessionStatusToTSession < ActiveRecord::Migration
  def up
    add_column :t_sessions, :t_session_status, :string
  end

  def down
  	remove_column :t_sessions, :t_session_status
  end
end
