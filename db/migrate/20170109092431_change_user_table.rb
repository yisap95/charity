class ChangeUserTable < ActiveRecord::Migration
  def change
    remove_column :users, :client_id, :string
    add_column :users, :public_token, :string
    add_column :users, :total_amount, :decimal
    add_column :users, :total_transactions, :decimal
  end
end
