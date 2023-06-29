class AddForeignKeyToItems < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :items, :orders, column: :order_id, on_delete: :cascade
  end
end
