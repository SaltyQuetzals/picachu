# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :reviews

  def self.ransortable_attributes(_auth_object = nil)
    column_names
  end

  def self.ransackable_attributes(_auth_object = nil)
    ransortable_attributes + _ransackers.keys
  end

  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new(
      '||',
      Arel::Nodes::InfixOperation.new(
        '||',
        Arel::Nodes::InfixOperation.new(
          '||',
          Arel::Nodes::InfixOperation.new(
            '||',
            parent.table[:dept],
            Arel::Nodes.build_quoted(' ')
          ),
          parent.table[:course_num]
        ),
        Arel::Nodes.build_quoted(' ')
      ),
      parent.table[:name]
    )
  end
end
