class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  has_rich_text :content

  after_create_commit {
    broadcast_append_to "chatroom_#{chatroom.id}",
      target: "messages",
      partial: 'messages/message'
  }
end

