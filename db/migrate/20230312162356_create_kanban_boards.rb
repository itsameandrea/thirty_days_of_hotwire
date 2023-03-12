class CreateKanbanBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :kanban_boards do |t|
      t.string :title

      t.timestamps
    end
  end
end
