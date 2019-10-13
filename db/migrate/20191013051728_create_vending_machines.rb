class CreateVendingMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :vending_machines do |t|
      t.integer :quantity_of_coke, default: 0
      t.integer :quantity_of_diet_coke, default: 0
      t.integer :quantity_of_tea, default: 0
      t.integer :number_of_100_yen, default: 0
      t.integer :charge, default: 0
      t.timestamps
    end
  end
end
