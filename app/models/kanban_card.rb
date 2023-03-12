class KanbanCard < ApplicationRecord
  belongs_to :kanban_column
  acts_as_list scope: :kanban_column
end
