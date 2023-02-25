class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :species
      t.string :homeworld
      t.string :affiliation
      t.string :image_url

      t.timestamps
    end
  end
end
