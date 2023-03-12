class KanbanBoardsController < ApplicationController
  def show
    @board = KanbanBoard.includes(kanban_columns: :kanban_cards).find(params[:id])
  end
end
