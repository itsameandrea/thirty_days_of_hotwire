class ToppingsController < ApplicationController
  def index
    @toppings = Topping.search(params)

    respond_to do |format|
      format.turbo_stream
    end
  end
end


