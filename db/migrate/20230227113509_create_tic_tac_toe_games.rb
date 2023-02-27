class CreateTicTacToeGames < ActiveRecord::Migration[7.0]
  def change
    create_table :tic_tac_toe_games do |t|
      t.string :winner_id
      t.boolean :draw

      t.timestamps
    end
  end
end
