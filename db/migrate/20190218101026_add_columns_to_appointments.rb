# frozen_string_literal: true

class AddColumnsToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :user, foreign_key: true
    add_column :appointments, :appointment_date, :datetime
  end
end
