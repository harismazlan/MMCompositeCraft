class Boat < ApplicationRecord
	include PgSearch
	pg_search_scope :search_boat, :against => [:boat_class]
end