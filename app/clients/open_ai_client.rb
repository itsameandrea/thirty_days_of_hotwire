class OpenAiClient
  def initialize()
    @client = OpenAI::Client.new(access_token: Rails.application.credentials.dig(:open_ai, :api_key))
  end

  def generate_recipe_for(coffee_prompt:)
    response = @client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [{
            role: "user",
            content: "
              You are the world barista champion.
              I have a #{coffee_prompt.roast_level} coffee.
              I want to brew a #{coffee_prompt.brew_method}.
              I want to drink it #{coffee_prompt.temperature}.
              Give me a step-by-step tasty recipe"
          }],
          temperature: 0.7
      })

    response.dig("choices", 0, "message", "content")
  end
end



