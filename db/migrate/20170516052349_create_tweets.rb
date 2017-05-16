class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :content, null: false, limit: 140
      t.string :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
