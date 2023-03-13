# To deliver this notification:
#
# NewFollower.with(post: @post).deliver_later(current_user)
# NewFollower.with(post: @post).deliver(current_user)

class NewFollowerNotification < Noticed::Base
  deliver_by :database

  param :follow

  def message
    "#{params[:follow].follower.username} is now a follower!"
  end
end


