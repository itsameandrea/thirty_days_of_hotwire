class Topping < ApplicationRecord
  has_many :pizza_toppings
  has_many :pizzas, through: :pizza_toppings

  scope :filter_by_name, -> (name) { where("name ILIKE ?", "%#{name}%") }

  def self.search(params)
    toppings = all
    toppings = toppings.filter_by_name(params[:name]) if params[:name].present?

    toppings
  end
end
