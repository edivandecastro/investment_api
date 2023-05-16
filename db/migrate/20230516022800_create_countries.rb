class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries, id: :uuid do |t|
      t.string :name, null: false, unique: true
      t.string :locale, null: false
      t.string :acronym, null: false, unique: true

      t.timestamps
    end
  end
end
