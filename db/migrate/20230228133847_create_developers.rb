class CreateDevelopers < ActiveRecord::Migration[7.0]
  def change
    create_table :developers do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :email
      t.string :skills
      t.integer :day_rate
      t.string :preferred_contract_duration

      t.timestamps
    end
  end
end
