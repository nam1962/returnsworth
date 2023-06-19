class CreateOrdersAndOrderItemsAndReturnItems < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :client_name
      t.integer :order_number
      t.timestamps
    end

    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.timestamps
    end

    create_table :return_items do |t|
      t.references :return, foreign_key: true
      t.references :order_item, foreign_key: true
      t.timestamps
    end
  end
end
