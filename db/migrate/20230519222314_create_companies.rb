class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :icon
      t.string :name, null: false
      t.string :ticker_symbol_prefix, null: false, index: { unique: true }
      t.string :code_cvm, index: { unique: true }
      t.string :description, null: false
      t.string :cnpj, null: false, index: { unique: true }
      t.string :website
      t.references :country, null: false, foreign_key: true, type: :uuid
      t.references :sector, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
