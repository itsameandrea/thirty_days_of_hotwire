class KanbanColumn < ApplicationRecord
  belongs_to :kanban_board
  has_many :kanban_cards, -> { order(position: :asc) }, dependent: :destroy 
end
