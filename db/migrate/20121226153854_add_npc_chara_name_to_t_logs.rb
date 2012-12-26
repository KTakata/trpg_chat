class AddNpcCharaNameToTLogs < ActiveRecord::Migration
  def up
    add_column :t_logs, :npc_chara_name, :string
  end

  def down
    remove_column :t_logs, :npc_chara_name
  end
end
