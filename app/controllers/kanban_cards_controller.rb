class KanbanCardsController < ApplicationController
  def update
    @card = KanbanCard.find(params[:id])
    
    if @card.update(card_params)
      flash.now[:notice] = "Kanban board updated"
    end
  end

  private

  def card_params
    params.require(:kanban_card).permit(:kanban_column_id, :position)
  end
end

