class AddChangesToDriver < ActiveRecord::Migration[5.2]
  def change
    remove_column :drivers, :category, :string
    add_column :drivers, :category, :integer
  end
end
