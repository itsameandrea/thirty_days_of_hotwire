class CreateKanbanCards < ActiveRecord::Migration[7.0]
  def change
    create_table :kanban_cards do |t|
      t.string :title
      t.integer :position
      t.belongs_to :kanban_column, null: false, foreign_key: true

      t.timestamps
    end
  end
end
