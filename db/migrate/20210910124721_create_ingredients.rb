class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :available_units
      t.float :price

      t.timestamps
    end

    create_table :comprising_ingredients do |t|
      t.belongs_to :beverage
      t.belongs_to :ingredient
      t.integer :units_used
    end
  end
end
