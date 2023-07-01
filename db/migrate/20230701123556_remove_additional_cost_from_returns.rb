class RemoveAdditionalCostFromReturns < ActiveRecord::Migration[7.0]
  def change
    remove_column :returns, :additional_cost, :integer
  end
end
