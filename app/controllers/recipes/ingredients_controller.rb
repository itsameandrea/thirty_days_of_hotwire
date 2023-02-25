module Recipes
  class IngredientsController < ApplicationController
    def destroy
      recipe = Recipe.find(params[:recipe_id])
      @ingredient = recipe.ingredients.find(params[:id])
      @ingredient.destroy
    end
  end
end