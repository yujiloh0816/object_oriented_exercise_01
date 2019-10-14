class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.integer :vending_machine_id
      t.integer :drink_type_id
      t.integer :quantity, default: 0
      t.timestamps
    end
  end
end
