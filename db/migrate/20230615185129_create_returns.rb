class CreateReturns < ActiveRecord::Migration[7.0]
  def change
    create_table :returns do |t|
      t.string :command_number
      t.string :client_name
      t.string :status
      t.string :state
      t.string :comment
      t.string :additional_cost
      t.string :exception
      t.boolean :restock
      t.bigint :return_id # to create the return_id column

      t.timestamps
    end
  end
end
