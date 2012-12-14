class AddScenarioNameToTSession < ActiveRecord::Migration
  def change
    add_column :t_sessions, :scenario_name, :string
  end
end
