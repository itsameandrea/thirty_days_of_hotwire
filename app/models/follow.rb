class Follow < ApplicationRecord
  belongs_to :followed_user, class_name: 'User'
  belongs_to :follower, class_name: 'User'

  after_create_commit :send_notification

  private

  def send_notification
    NewFollowerNotification.with(follow: self).deliver_later(followed_user)
  end
end


