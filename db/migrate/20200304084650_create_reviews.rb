class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :order
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :driver, foreign_key: true
      t.text :decription

      validates :rating, numericality: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }

      t.timestamps
    end
  end

end
