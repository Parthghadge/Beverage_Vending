class ComprisingIngredient < ApplicationRecord
	belongs_to :beverage
	belongs_to :ingredient
end
