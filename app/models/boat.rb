# frozen_string_literal: true

class Boat < ApplicationRecord
  validates :make, :model, :year, :condition, :price, :make_type, :boat_class, :length, :fuel_type, :hull_material, presence: true
  include PgSearch
  pg_search_scope :search_boat, against: [:boat_class]
end
