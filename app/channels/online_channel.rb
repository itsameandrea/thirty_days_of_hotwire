class OnlineChannel < Turbo::StreamsChannel
  def subscribed
    super
    ActionCable.server.pubsub.redis_connection_for_subscriptions.sadd "online_users", current_user.id
    current_user.broadcast_online
  end

  def unsubscribed
    super
    ActionCable.server.pubsub.redis_connection_for_subscriptions.srem "online_users", current_user.id
    current_user.broadcast_offline
  end
end