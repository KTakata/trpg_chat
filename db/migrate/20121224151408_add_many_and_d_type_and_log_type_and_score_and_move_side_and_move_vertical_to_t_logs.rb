class AddManyAndDTypeAndLogTypeAndScoreAndMoveSideAndMoveVerticalToTLogs < ActiveRecord::Migration
  def up
    add_column :t_logs, :many, :integer #ダイス数
    add_column :t_logs, :d_type, :integer #ダイス種類
    add_column :t_logs, :score, :integer #ダイス総計
    add_column :t_logs, :log_type, :string #ログの種類（発言/ダイス/動き)
    add_column :t_logs, :move_side, :integer #map移動（左右）
    add_column :t_logs, :move_vertical, :integer #map移動（上下）
  end

  def down
    remove_column :t_logs, :many
    remove_column :t_logs, :d_type
    remove_column :t_logs, :score
    remove_column :t_logs, :log_type
    remove_column :t_logs, :move_side
    remove_column :t_logs, :move_vertical
  end
end
