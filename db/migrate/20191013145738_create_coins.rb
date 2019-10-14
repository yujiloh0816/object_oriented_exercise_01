class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.integer :amount
      t.integer :kind
      t.timestamps
    end
  end
end
