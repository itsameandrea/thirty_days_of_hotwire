class TicTacToeGame < ApplicationRecord
  belongs_to :winner, class_name: 'User', optional: true
  has_many :tic_tac_toe_moves, dependent: :destroy
  
  kredis_unique_list :player_ids, limit: 2

  def players
    User.where(id: player_ids.elements)
  end

  def has_move?(position:)
    tic_tac_toe_moves.exists?(position: position)
  end

  def move_at(position:)
    tic_tac_toe_moves.find_by(position: position)
  end

  def add_player(user)
    player_ids << user.id
  end

  def player?(user)
    player_ids.elements.include?(user.id)
  end

  def first_player?(player)
    players.first == player
  end

  def full?
    player_ids.elements.size == 2
  end

  def over?
    winner.present? || tic_tac_toe_moves.count == 9
  end

  def symbol_for(player)
    player == players.first ? 'x' : '0'
  end
end
