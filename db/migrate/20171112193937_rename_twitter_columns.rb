class RenameTwitterColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :twitter_id, :uid
    rename_column :users, :username, :screen_name
  end
end
