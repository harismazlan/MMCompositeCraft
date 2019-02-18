class RenameClassInBoatsToBoatClass < ActiveRecord::Migration[5.2]
  def change
  	rename_column :boats, :class, :boat_class
  end
end
