class CreateDrinkStorages < ActiveRecord::Migration[5.1]
  def change
    create_table :drink_storages do |t|
      t.integer :vending_machine_id, null: false

      t.timestamps
    end
  end
end
