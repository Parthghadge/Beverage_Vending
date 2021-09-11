class BeveragesController < ApplicationController
	def index
		@beverages = Beverage.all
	end

	def show
	end
end
