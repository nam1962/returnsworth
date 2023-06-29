class RemoveReturnIdFromReturns < ActiveRecord::Migration[7.0]
  def change
    remove_column :returns, :return_id, :integer
  end
end
