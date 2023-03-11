class CreatePizzaToppings < ActiveRecord::Migration[7.0]
  def change
    create_table :pizza_toppings do |t|
      t.belongs_to :topping, null: false, foreign_key: true
      t.belongs_to :pizza, null: false, foreign_key: true

      t.timestamps
    end
  end
end
