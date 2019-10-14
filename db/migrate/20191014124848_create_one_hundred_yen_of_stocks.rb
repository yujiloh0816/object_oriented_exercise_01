class CreateOneHundredYenOfStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :one_hundred_yen_of_stocks do |t|
      t.integer :vending_machine_id

      t.timestamps
    end
  end
end
