class Pizza < ApplicationRecord
  has_many :pizza_toppings
  has_many :toppings, through: :pizza_toppings

  def topping_names
    toppings.map(&:name).join(', ').titleize
  end
end
