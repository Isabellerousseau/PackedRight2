class CreateParcels < ActiveRecord::Migration[5.2]
  def change
    create_table :parcels do |t|
      t.string :name
      t.integer :weight
      t.string :category
      t.boolean :fragile

      t.timestamps
    end
  end
end
