class Ingredient < ApplicationRecord
  has_many :comprising_ingredients
  has_many :beverages, through: :comprising_ingredients
end
