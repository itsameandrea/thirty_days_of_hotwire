class CoffeePromptsController < ApplicationController
  def new
    @coffee_prompt = CoffeePrompt.new
  end

  def create
    @coffee_prompt = CoffeePrompt.new(coffee_prompt_params)
    
    unless @coffee_prompt.save
      render :new
    end
  end

  private

  def coffee_prompt_params
    params.require(:coffee_prompt).permit(:brew_method, :temperature, :roast_level)
  end
end
