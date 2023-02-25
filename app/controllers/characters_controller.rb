class CharactersController < ApplicationController
  def index
    @characters = Character.search(params)

    @species = Character.pluck(:species).uniq
    @homeworlds = Character.pluck(:homeworld).uniq
    @affiliations = Character.pluck(:affiliation).uniq
  end
end


