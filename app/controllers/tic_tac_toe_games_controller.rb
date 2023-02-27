class TicTacToeGamesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @games = TicTacToeGame.all
  end

  def show
    @game = TicTacToeGame.find(params[:id])
    @game.add_player(current_user) unless @game.player?(current_user)
  end

  def create
    @game = TicTacToeGame.create
    @game.add_player(current_user)

    redirect_to @game
  end
end
