class AddTSessionIdToTLogs < ActiveRecord::Migration
  def up
    add_column :t_logs, :t_session_id, :integer
  end

  def down
    remove_column :t_logs, :t_session_id
  end
end
