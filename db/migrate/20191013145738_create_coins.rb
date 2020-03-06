class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.integer :change_money_id
      t.integer :cash_box_id
      t.integer :kind, null: false

      t.timestamps
    end
  end
end
