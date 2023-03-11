class PizzasController < ApplicationController
  def index
    @toppings = Topping.limit(5)
  end
end
