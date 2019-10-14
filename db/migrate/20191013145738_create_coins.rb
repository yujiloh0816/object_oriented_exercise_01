class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.integer :amount
      t.integer :kind
      t.integer :change_money_id
      t.integer :one_hundred_yen_of_stock_id
      t.timestamps
    end
  end
end
