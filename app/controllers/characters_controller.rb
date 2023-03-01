class CharactersController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @characters = pagy(Character.search(params), items: 5)

    @species = Character.pluck(:species).uniq
    @homeworlds = Character.pluck(:homeworld).uniq
    @affiliations = Character.pluck(:affiliation).uniq
  end

  def destroy
    @character = Character.find(params[:id])

    respond_to do |format|
      if @character.destroy
        flash.now[:notice] = "Character was successfully deleted"
        format.turbo_stream
      end
    end
  end
end


