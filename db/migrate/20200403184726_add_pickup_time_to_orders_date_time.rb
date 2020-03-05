class AddPickupTimeToOrdersDateTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :date, :date
    add_column :orders, :pickup_time, :datetime
  end
end
