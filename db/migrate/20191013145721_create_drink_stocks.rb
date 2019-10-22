class CreateDrinkStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :drink_stocks do |t|
      t.integer :drink_storage_id, null: false
      t.integer :drink_type_id, null: false

      t.timestamps
    end
  end
end
