# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :user
  enum appointment_status: %i[Pending Accepted Rejected]
  include PgSearch
  pg_search_scope :search_appointment, against: [:user_id]
end
