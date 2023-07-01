class AddAdditionalCostToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :additional_cost, :integer
  end
end
