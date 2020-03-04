class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :password
      t.boolean :approved
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
