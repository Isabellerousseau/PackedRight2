class ChangeAvailableToActiveDriver < ActiveRecord::Migration[5.2]
  def change
    rename_column :drivers, :available, :active
  end
end
