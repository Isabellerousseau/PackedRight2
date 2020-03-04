class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :driver, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.string :content

      t.timestamps
    end
  end
end
