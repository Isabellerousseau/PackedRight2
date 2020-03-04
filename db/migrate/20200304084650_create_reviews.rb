class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :order
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :driver, foreign_key: true
      t.text :decription

      t.timestamps
    end
  end
end
