class BeveragesController < ApplicationController
  def index
    @beverages = Beverage.all.order(:id)
  end

  def show; end
end
