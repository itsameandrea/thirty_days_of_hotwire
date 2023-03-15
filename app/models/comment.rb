class Comment < ApplicationRecord
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :replies, foreign_key: "parent_id", class_name: "Comment", dependent: :destroy

  default_scope { order(created_at: :desc) }
  scope :top_level, -> { where(parent_id: nil) }
end
