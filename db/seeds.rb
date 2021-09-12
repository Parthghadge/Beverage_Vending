Beverage.create!([
  {name: "Coffee with milk", price: 100.0, description: "Milk Coffee are considered an introductory coffee drink since the acidity and bitterness of coffee is cut by the amount of milk in the beverage.", expiry: "2022-09-10", available: false},
  {name: "(Sugarless) Coffee with milk", price: 90.0, description: "Sugarless Milk Coffee are considered an introductory coffee drink since the acidity of coffee is cut by the amount of milk in the beverage. It will come without sugar and the taste will incline towards the bitter side", expiry: "2022-09-10", available: false},
  {name: "(Sugarless) Black Coffee", price: 50.0, description: "Sugarless Black coffee is simply coffee that is normally brewed without the addition of additives such as sugar, milk, cream, or added flavors. While it has a slightly bitter taste compared to when it is flavored with additives, many people love a strong cup of black coffee. In fact, for some, it is part of their everyday diet. It will come without sugar and the taste will incline towards the bitter side", expiry: "2022-09-10", available: false},
  {name: "Black Coffee", price: 80.0, description: "Black coffee is simply coffee that is normally brewed without the addition of additives such as sugar, milk, cream, or added flavors. While it has a slightly bitter taste compared to when it is flavored with additives, many people love a strong cup of black coffee. In fact, for some, it is part of their everyday diet.", expiry: "2022-09-10", available: false}
])
Ingredient.create!([
  {name: "Milk", available_units: 62, price: 20.0},
  {name: "Water", available_units: 0, price: nil},
  {name: "Coffee", available_units: 3, price: 40.0},
  {name: "Sugar", available_units: 67, price: 10.0}
])
ComprisingIngredient.create!([
  {beverage_id: 1, ingredient_id: 1, units_used: 3},
  {beverage_id: 1, ingredient_id: 2, units_used: 1},
  {beverage_id: 1, ingredient_id: 3, units_used: 1},
  {beverage_id: 2, ingredient_id: 1, units_used: 1},
  {beverage_id: 2, ingredient_id: 2, units_used: 1},
  {beverage_id: 2, ingredient_id: 3, units_used: 1},
  {beverage_id: 2, ingredient_id: 4, units_used: 2},
  {beverage_id: 3, ingredient_id: 1, units_used: 3},
  {beverage_id: 3, ingredient_id: 2, units_used: 1},
  {beverage_id: 4, ingredient_id: 1, units_used: 1},
  {beverage_id: 4, ingredient_id: 2, units_used: 1},
  {beverage_id: 4, ingredient_id: 4, units_used: 2}
])
