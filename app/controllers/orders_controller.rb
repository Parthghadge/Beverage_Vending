class OrdersController < ApplicationController
  def checkout
    beverage = Beverage.find_by(name: params['beverage_name'])

    insufficient_ingredients = beverage.ingredients.where('ingredients.available_units < comprising_ingredients.units_used').to_a

    place_order(beverage) if insufficient_ingredients.empty?
    unavailable_beverages = Beverage.joins(:ingredients).where('ingredients.available_units < comprising_ingredients.units_used')
    unavailable_beverages.update_all(available: false)
    unavailable_beverages = unavailable_beverages.uniq.pluck(:name)

    if insufficient_ingredients.empty?
      render json: { message: 'Order placed successfully', unavailable_beverages: unavailable_beverages }
    else
      render json: { message: "Insufficient #{insufficient_ingredients.pluck(:name).join(', ')}",
                     unavailable_beverages: unavailable_beverages }
    end
  end

  private

  def place_order(beverage)
    beverage.comprising_ingredients.each do |comprising_ingredient|
      remaining_units = comprising_ingredient.ingredient.available_units - comprising_ingredient.units_used
      comprising_ingredient.ingredient.update(available_units: remaining_units)
    end
  end
end
