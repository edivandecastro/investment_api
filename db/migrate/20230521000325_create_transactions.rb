class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.integer :operation_type, null: false
      t.date :trading_date, null: false
      t.decimal :quantity, null: false
      t.decimal :unit_value, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :investible, null: false, type: :uuid, polymorphic: true

      t.timestamps
    end
  end
end
