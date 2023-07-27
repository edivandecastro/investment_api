class CreateSectors < ActiveRecord::Migration[7.0]
  def change
    create_table :sectors, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
