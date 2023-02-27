class TicTacToeMovesController < ApplicationController
  def create
    @game = TicTacToeGame.find(params[:tic_tac_toe_game_id])
    TicTacToeMove.make(move_params.merge(tic_tac_toe_game: @game, user: current_user))
  end

  private

  def move_params
    params.require(:tic_tac_toe_move).permit(:position)
  end
end

