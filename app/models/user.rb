class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :messages, dependent: :destroy
  has_many :tic_tac_toe_games, dependent: :destroy
  has_many :tic_tac_toe_moves, dependent: :destroy

  has_many :notifications, as: :recipient, dependent: :destroy

  has_many :followees, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
  has_many :followed_users, through: :followees

  has_many :following_users, foreign_key: :followed_user_id, class_name: "Follow", dependent: :destroy
  has_many :followers, through: :following_users

  def self.online
    ids = ActionCable.server.pubsub.redis_connection_for_subscriptions.smembers("online_users")
    where(id: ids)
  end

  def broadcast_online
    broadcast_append_to "online_users", target: "online_users",
      partial: 'users/card',
      locals: { user: self }
  end

  def broadcast_offline
    broadcast_remove_to "online_users", target: "user_#{id}"
  end
end

