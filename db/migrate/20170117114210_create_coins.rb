class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.integer :money_value
      t.string :lat
      t.string :lng
      t.timestamps null: false
    end
    drop_table :users

  end
end
