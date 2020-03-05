class AddOrderToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :order, foreign_key: true, index: true
  end
end
