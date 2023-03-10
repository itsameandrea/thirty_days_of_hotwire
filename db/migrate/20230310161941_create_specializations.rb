class CreateSpecializations < ActiveRecord::Migration[7.0]
  def change
    create_table :specializations do |t|
      t.string :name
      t.belongs_to :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
