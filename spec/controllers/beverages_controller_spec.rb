require "rails_helper"

RSpec.describe BeveragesController do
  describe "GET index" do
    it "assigns @beverages" do
      get :index
      expect(assigns(:beverages)).to eq(Beverage.all)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
