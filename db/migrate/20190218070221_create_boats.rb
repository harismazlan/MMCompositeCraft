# frozen_string_literal: true

class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :condition
      t.integer :price
      t.string :type
      t.string :class
      t.integer :length
      t.string :fuel_type
      t.string :hull_material

      t.timestamps
    end
  end
end
