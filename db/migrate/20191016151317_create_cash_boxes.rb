class CreateCashBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :cash_boxes do |t|
      t.integer :coin_mech_id, null: false

      t.timestamps
    end
  end
end
