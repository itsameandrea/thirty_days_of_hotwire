class CreateKanbanColumns < ActiveRecord::Migration[7.0]
  def change
    create_table :kanban_columns do |t|
      t.string :title
      t.integer :position
      t.belongs_to :kanban_board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
