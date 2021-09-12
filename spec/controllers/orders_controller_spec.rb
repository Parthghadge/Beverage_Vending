require "rails_helper"

RSpec.describe OrdersController, type: :controller do
  describe "POST checkout" do
    context "sufficient inventory" do
      let(:beverage) { Beverage.create(name: "test") }
      let(:ingredient) { Ingredient.create(name: "test_ingredient", available_units: 10) }
      let!(:comprising_ingredient) { ComprisingIngredient.create(beverage_id: beverage.id, ingredient_id: ingredient.id, units_used: 2) }

      it "successfully places order" do
        get :checkout, params: { beverage_name: beverage.name }
        expect(JSON.parse(response.body)["message"]).to eq("Order placed successfully")
      end

      it "updates the inventory" do
        get :checkout, params: { beverage_name: beverage.name }
        expect(ingredient.reload.available_units).to eq(8)
      end

      it "returns array of unavailable beverages" do
        get :checkout, params: { beverage_name: beverage.name }
        unavailable_bev = Beverage.joins(:ingredients).where("ingredients.available_units < comprising_ingredients.units_used").uniq.pluck(:name)
        expect(JSON.parse(response.body)["unavailable_beverages"]).to eq(unavailable_bev)
      end
    end

    context "Insufficient inventory" do
      let(:beverage) { Beverage.create(name: "test") }
      let(:ingredient) { Ingredient.create(name: "test_ingredient", available_units: 1) }
      let!(:comprising_ingredient) { ComprisingIngredient.create(beverage_id: beverage.id, ingredient_id: ingredient.id, units_used: 5) }

      it "returns error message" do
        get :checkout, params: { beverage_name: beverage.name }
        expect(JSON.parse(response.body)["message"]).to eq("Insufficient test_ingredient")
      end

      it "updates the beverage availability" do
        get :checkout, params: { beverage_name: beverage.name }
        expect(beverage.reload.available).to be_falsey
      end

      it "returns array of unavailable beverages" do
        get :checkout, params: { beverage_name: beverage.name }
        unavailable_bev = Beverage.joins(:ingredients).where("ingredients.available_units < comprising_ingredients.units_used").uniq.pluck(:name)
        expect(JSON.parse(response.body)["unavailable_beverages"]).to eq(unavailable_bev)
      end
    end
  end
end
