class Appointment < ApplicationRecord
	belongs_to :user
	enum appointment_status: [:Pending, :Accepted, :Rejected]
end
