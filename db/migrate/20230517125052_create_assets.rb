class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets, id: :uuid do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
  end
end
