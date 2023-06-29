class UpdateForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :items, :orders
    remove_foreign_key :returns, :orders

    add_foreign_key :items, :orders, on_delete: :cascade
    add_foreign_key :returns, :orders, on_delete: :cascade
  end
end
