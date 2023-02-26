class CharactersController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @characters = pagy(Character.search(params), items: 5)

    @species = Character.pluck(:species).uniq
    @homeworlds = Character.pluck(:homeworld).uniq
    @affiliations = Character.pluck(:affiliation).uniq
  end
end


