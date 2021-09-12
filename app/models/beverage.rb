class Beverage < ApplicationRecord
  has_many :comprising_ingredients
  has_many :ingredients, through: :comprising_ingredients
end
