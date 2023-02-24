class NestedIngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @id = params[:id]
    @ingredient = Ingredient.find_by(id: params[:id])

    respond_to do |format|
      format.turbo_stream
    end
  end
end
