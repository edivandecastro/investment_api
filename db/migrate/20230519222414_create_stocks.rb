class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks, id: :uuid do |t|
      t.string :icon, null: false
      t.string :ticker_symbol, null: false, index: { unique: true }
      t.integer :stock_type, null: false
      t.string :isin, index: { unique: true }
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.references :asset, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
