# frozen_string_literal: true

class CreateAuthentications < ActiveRecord::Migration[5.2]
  def change
    create_table :authentications do |t|
      t.string :uid
      t.string :token
      t.string :provider
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
