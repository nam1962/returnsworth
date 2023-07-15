class ChangeDefaultStatusForReturns < ActiveRecord::Migration[7.0]
  def change
    change_column_default :returns, :status, "pending"
  end
end
