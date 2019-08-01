# frozen_string_literal: true

class RenameTypeToMakeTypeOnBoats < ActiveRecord::Migration[5.2]
  def change
    rename_column :boats, :type, :make_type
  end
end
