class CoffeePrompt < ApplicationRecord
  after_create_commit :generate_recipe

  enum brew_method: {
    espresso: "espresso",
    v60: "v60",
    aeropress: "aeropress",
  }

  enum roast_level: {
    light: "light",
    medium: "medium",
    dark: "dark"
  }

  enum temperature: {
    hot: "hot",
    iced: "iced"
  }

  private

  def generate_recipe
    GenerateCoffeeRecipeJob.perform_later(self)
  end
end


