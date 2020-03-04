class AddCategoryToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :category, :string
  end
end
