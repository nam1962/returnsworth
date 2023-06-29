class CreateOrdersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.string :client_name

      t.timestamps
    end
  end
end
