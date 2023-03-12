class KanbanBoard < ApplicationRecord
  has_many :kanban_columns, dependent: :destroy
end
