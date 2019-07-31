# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # to disable this class from being considered as part fo the Single Table Inheritance (STI) hierarchy
  # In this case, when using abstract_class, ApplicationRecord is omitted from the hierarchy
end
