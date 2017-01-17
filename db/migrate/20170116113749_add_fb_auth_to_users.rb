class AddFbAuthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_auth, :string
    remove_column :users, :fb_uid
    remove_column :users, :fb_token
  end
end
