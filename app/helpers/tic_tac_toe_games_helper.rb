module TicTacToeGamesHelper
  def symbol_for(player:, game:)
    player_index = game.players.index(player)
    player_index == 0 ? '❌' : '⭕'
  end
end
