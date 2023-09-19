class CreateSystemConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :system_configurations, id: :uuid do |t|
      t.jsonb :settings

      t.timestamps
    end
  end
end
