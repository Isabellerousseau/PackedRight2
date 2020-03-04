class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.float :longitude
      t.float :latitude
      t.references :order, foreign_key: true
      t.integer :distance

      t.timestamps
    end
  end
end
