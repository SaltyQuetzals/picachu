# frozen_string_literal: true

class Professor < ApplicationRecord
  has_many :reviews

  def self.ransortable_attributes(_auth_object = nil)
    column_names
  end

  def self.ransackable_attributes(_auth_object = nil)
    ransortable_attributes
  end
end
