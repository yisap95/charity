class AddColumnsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :client_id, :string
    add_column :users, :fb_uid, :string
    add_column :users, :fb_token, :string
  end

  def down
    remove_column :users, :last_name
    remove_column :users, :first_name
    remove_column :users, :client_id
    remove_column :users, :fb_uid
    remove_column :users, :fb_token
  end
end
