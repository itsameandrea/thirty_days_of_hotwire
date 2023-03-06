class PagesController < ApplicationController
  def kitchensink
  end

  def multiple_select
    @technologies = Technology.search(params)
    @favourites = FavouriteTechnology.includes(:technology).all
  end

  def online_users
    @online_users = User.online
  end

  def modal
  end

  def coffeegpt
  end

  def tabs
  end

  def profile_tab
  end

  def personal_info_tab
  end

  def notifications_tab
  end
end
