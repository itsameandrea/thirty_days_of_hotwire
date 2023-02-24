class IngredientsController < ApplicationController
  def destroy
    @ingredient = Ingredient.find(params[:id])

    respond_to do |format|
      if @ingredient.destroy 
        format.turbo_stream
      end
    end
  end
end
