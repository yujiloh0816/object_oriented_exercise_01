class CreateDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks do |t|
      t.integer :drink_type_id
      t.timestamps
    end
  end
end
