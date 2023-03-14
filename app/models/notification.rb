class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  after_create_commit :broadcast_to_recipient

  def broadcast_to_recipient
    broadcast_append_to(
      "notifications_#{recipient.id}",
      target: "notifications_list",
      partial: "notifications/notification",
      locals: {
        notification: self
      }
    )

    broadcast_append_to(
      "notifications_#{recipient.id}",
      target: "notifications_icon",
      partial: "notifications/red_dot"
    )
  end
end

