class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :content
      t.string :handle
      t.string :image_url
      
      t.timestamps
    end
  end
end
