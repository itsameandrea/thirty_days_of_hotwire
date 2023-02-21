class PagesController < ApplicationController
  def kitchensink
    @online_users = User.online
  end

  def multiple_select
    @technologies = Technology.search(params)
    @favourites = FavouriteTechnology.includes(:technology).all
  end

  def online_users
    @online_users = User.online
  end
end
