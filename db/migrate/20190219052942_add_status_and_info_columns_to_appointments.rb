class AddStatusAndInfoColumnsToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :appointment_status, :integer, default:0
    add_column :appointments, :appointment_info, :string
  end
end
