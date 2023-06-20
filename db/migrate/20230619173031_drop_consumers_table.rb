class DropConsumersTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :consumers
  end

  def down
    create_table :consumers do |t|
      t.integer :command_number
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.timestamps
    end
  end
end
