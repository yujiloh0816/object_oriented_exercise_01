class CreateMoney < ActiveRecord::Migration[5.1]
  def change
    create_table :money do |t|
      t.integer :coin_id, null: false
      t.integer :amount, default: 0, null: false

      t.timestamps
    end
  end
end
