# frozen_string_literal: true

class Professor < ApplicationRecord
  def as_json(options = {})
    options[:except] ||= %i[id created_at updated_at]
    super(options)
  end

  def self.ransortable_attributes(_auth_object = nil)
    column_names
  end

  # Whitelist the Professor model attributes for search.
  def self.ransackable_attributes(_auth_object = nil)
    ransortable_attributes
  end
end
