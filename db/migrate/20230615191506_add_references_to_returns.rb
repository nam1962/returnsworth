class AddReferencesToReturns < ActiveRecord::Migration[7.0]
  def change
    add_column :returns, :warehouse_operator_id, :integer
    add_column :returns, :client_service_officer_id, :integer
  end
end
