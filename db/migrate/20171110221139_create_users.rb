class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :twitter_id
      t.string :avatar

      t.timestamps

      t.index :twitter_id, unique: true
    end
  end
end
