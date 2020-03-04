class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :date
      t.integer :status
      t.integer :category
      t.integer :weight
      t.boolean :fragile
      t.references :driver, foreign_key: true
      t.references :user, foreign_key: true
      t.monetize :estimated_price
      t.references :parcel, foreign_key: true
      t.string :pickup
      t.string :drop_off

      t.timestamps
    end
  end
end
