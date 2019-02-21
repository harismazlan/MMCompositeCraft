class Appointment < ApplicationRecord
	belongs_to :user
	enum appointment_status: [:Pending, :Accepted, :Rejected]
	include PgSearch
	pg_search_scope :search_appointment, :against => [:user_id]
end