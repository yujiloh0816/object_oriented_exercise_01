class CreateDrinkTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :drink_types do |t|
      t.integer :kind, null: false
      t.timestamps
    end
  end
end
