class AddRestockToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :restock, :boolean
  end
end
