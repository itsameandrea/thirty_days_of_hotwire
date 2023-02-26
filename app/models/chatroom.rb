class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
end

