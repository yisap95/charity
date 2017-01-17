class ChangeUserTable1 < ActiveRecord::Migration
  def change
    add_column :users, :stripe_user_id, :string
    add_column :users, :plaid_access_token, :string
    remove_column :users, :public_token, :string
  end
end
