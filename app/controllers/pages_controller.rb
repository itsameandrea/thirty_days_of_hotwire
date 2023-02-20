class PagesController < ApplicationController
  def kitchensink
  end

  def multiple_select
    @technologies = Technology.search(params)
    @favourites = FavouriteTechnology.includes(:technology).all
  end
end
