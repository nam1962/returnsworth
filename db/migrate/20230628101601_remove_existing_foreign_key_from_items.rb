class RemoveExistingForeignKeyFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :items, column: :order_id
  end
end
