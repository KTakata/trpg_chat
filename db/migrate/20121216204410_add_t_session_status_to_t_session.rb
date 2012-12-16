class AddTSessionStatusToTSession < ActiveRecord::Migration
  def change
    add_column :t_sessions, :t_session_status, :string
  end
end
