class TicTacToeMove < ApplicationRecord
  belongs_to :tic_tac_toe_game
  belongs_to :user

  validates :position, presence: true, inclusion: { in: 0..8 }
  validates :move_number, presence: true, inclusion: { in: 0..8 }, uniqueness: { scope: :tic_tac_toe_game_id }

  after_create_commit :broadcast_move

  WINNING_COMBINATIONS = [ 
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8], 
    [6,4,2]
  ]

  def broadcast_move
    broadcast_id = "tic_tac_toe_game_#{tic_tac_toe_game.id}"

    if winning?
      tic_tac_toe_game.update!(winner: user)

      broadcast_update_to broadcast_id,
        target: broadcast_id,
        partial: "tic_tac_toe_games/winner",
        locals: { user: user }
    elsif last?
      broadcast_update_to broadcast_id,
        target: broadcast_id,
        partial: "tic_tac_toe_games/draw"
    else
      broadcast_replace_to broadcast_id,
        target: "position_#{position}",
        partial: "tic_tac_toe_moves/symbol_#{tic_tac_toe_game.symbol_for(user)}"
    end
  end

  def self.make(params)
    transaction do
      move = create!(params)
      move.increment!(:move_number)
    end
  end

  def winning?
    WINNING_COMBINATIONS.any? do |combination|
      combination.all? do |position|
        tic_tac_toe_game.move_at(position: position).try(:user) == user
      end
    end
  end

  def last?
    move_number == 8
  end
end
