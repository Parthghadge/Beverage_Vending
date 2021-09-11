class CreateBeverages < ActiveRecord::Migration[5.2]
  def change
    create_table :beverages do |t|
      t.string :name
      t.float :price
      t.text :description
      t.date :expiry
      t.boolean :available

      t.timestamps
    end
  end
end
