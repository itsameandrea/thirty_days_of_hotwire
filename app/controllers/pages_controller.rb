class PagesController < ApplicationController
  layout :resolve_layout

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

  def landing_page
  end

  def track_event
    # some business logic event
    # that we want to track
    
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def resolve_layout
    case action_name
    when "landing_page"
      "landing"
    else
      "application"
    end
  end
end
