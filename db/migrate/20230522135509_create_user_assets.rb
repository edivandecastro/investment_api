class CreateUserAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :user_assets, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :investible, null: false, type: :uuid, polymorphic: true
      t.decimal :amount, null: false
      t.decimal :balance, null: false

      t.timestamps
    end
  end
end
