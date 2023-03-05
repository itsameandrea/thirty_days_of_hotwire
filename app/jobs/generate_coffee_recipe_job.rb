class GenerateCoffeeRecipeJob < ApplicationJob
  queue_as :default

  def perform(coffee_prompt)
    client = OpenAiClient.new
    recipe = client.generate_recipe_for(coffee_prompt: coffee_prompt)

    Turbo::StreamsChannel.broadcast_replace_to "coffee_prompt_#{coffee_prompt.id}",
      target: "loading",
      partial: 'coffee_prompts/recipe', locals: { recipe: recipe }
  end
end


