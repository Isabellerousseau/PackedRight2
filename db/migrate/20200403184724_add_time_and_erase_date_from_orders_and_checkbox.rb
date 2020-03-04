class AddTimeAndEraseDateFromOrdersAndCheckbox < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :date, :date
    add_column :orders, :pickup_time, :time
    add_column :orders, :now, :boolean
  end
end
