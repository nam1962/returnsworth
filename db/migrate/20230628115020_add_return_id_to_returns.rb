class AddReturnIdToReturns < ActiveRecord::Migration[7.0]
  def change
    add_column :returns, :return_id, :integer
    add_index :returns, :return_id
  end
end
