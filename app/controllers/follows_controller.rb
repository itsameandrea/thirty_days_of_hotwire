class FollowsController < ApplicationController
  def create
    @follow = Follow.create(follower_id: current_user.id, followed_user_id: params[:followed_user_id])
  end
end

