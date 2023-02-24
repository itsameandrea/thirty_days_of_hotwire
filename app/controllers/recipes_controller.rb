class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new(ingredients: [Ingredient.new])
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to root_path, notice: "Recipe was successfully created."
    end
  end

  def index
    @recipes = Recipe.all
  end

  def edit
    @recipe = Recipe.includes(:ingredients).find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to root_path, notice: "Recipe was successfully created."
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredients_attributes: [:id, :name, :_destroy])
  end
end
