class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string  :message
      t.integer :user_id

      t.timestamps
    end
    add_index :tweets, [:user_id, :created_at]

  end
end
