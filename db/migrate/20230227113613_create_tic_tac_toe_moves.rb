class CreateTicTacToeMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :tic_tac_toe_moves do |t|
      t.belongs_to :tic_tac_toe_game, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :move_number, default: 0
      t.integer :position

      t.timestamps
    end
  end
end
