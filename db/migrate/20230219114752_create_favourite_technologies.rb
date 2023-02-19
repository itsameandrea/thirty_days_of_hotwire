class CreateFavouriteTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :favourite_technologies do |t|
      t.belongs_to :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
