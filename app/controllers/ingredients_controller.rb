class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def update_inventory
    @ingredient = Ingredient.find_by(name: ingredient_params["name"])
    if @ingredient.present?
      updated_inventory = ingredient_params[:available_units].to_i + @ingredient.available_units
      @ingredient.update(price: ingredient_params[:price], available_units: updated_inventory)
      flash[:notice] = "Ingredient inventory updated"
      Beverage.joins(:ingredients).where("ingredients.available_units > comprising_ingredients.units_used").update_all(available: true)
    else
      flash[:notice] = "Ingredient not found"
    end
    @ingredients = Ingredient.all
    redirect_to "/ingredients"
  end

  private

  def ingredient_params
    params.permit(:name, :price, :available_units)
  end
end
