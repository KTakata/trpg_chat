class ChangeBodyTypeToTLogs < ActiveRecord::Migration
  def up
    change_column :t_logs, :body, :text
  end

  def down
    change_column :t_logs, :body, :string
  end
end
