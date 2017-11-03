class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
