class CreateChangeMoneys < ActiveRecord::Migration[5.1]
  def change
    create_table :change_moneys do |t|
      t.integer :payment_id, null: false

      t.timestamps
    end
  end
end
