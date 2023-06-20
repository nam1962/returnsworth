class ChangeAdditionalCostTypeInReturns < ActiveRecord::Migration[6.0]
  def change
    change_column :returns, :additional_cost, :integer, using: 'additional_cost::integer'
  end
end
