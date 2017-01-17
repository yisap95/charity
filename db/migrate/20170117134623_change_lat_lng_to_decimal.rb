class ChangeLatLngToDecimal < ActiveRecord::Migration
  def change

    remove_column :coins, :lat
    remove_column :coins, :lng

    add_column :coins, :lat, :decimal
    add_column :coins, :lng, :decimal


  end
end
