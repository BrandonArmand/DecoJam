class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, default: "", null: false
    add_index :users, :username, unique: true
  end
end
