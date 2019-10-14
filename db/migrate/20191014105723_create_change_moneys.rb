class CreateChangeMoneys < ActiveRecord::Migration[5.1]
  def change
    create_table :change_moneys do |t|
      t.integer :vending_machine_id

      t.timestamps
    end
  end
end
