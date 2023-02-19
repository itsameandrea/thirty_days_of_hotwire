class PagesController < ApplicationController
  def kitchensink
    @technologies = Technology.search(params)
    @favourites = FavouriteTechnology.includes(:technology).all
  end
end
