class CreateCoinMeches < ActiveRecord::Migration[5.1]
  def change
    create_table :coin_meches do |t|
      t.integer :vending_machine_id, null: false

      t.timestamps
    end
  end
end
