class AddUserReferencesToDriver < ActiveRecord::Migration[5.2]
  def change
    add_reference :drivers, :user, foreign_key: true
    add_column :drivers, :address, :string
    remove_column :drivers, :password, :string
  end
end
