class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :admin, :boolean
    add_column :users, :location, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
