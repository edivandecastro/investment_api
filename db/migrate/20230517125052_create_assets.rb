class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets, id: :uuid do |t|
      t.string :icon, null: false
      t.string :codes, null: false
      t.string :name, null: false
      t.string :description, null: false
      t.string :sector, null: false
      t.decimal :price, null: false, scale: 12, precision: 14
      t.references :country, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
