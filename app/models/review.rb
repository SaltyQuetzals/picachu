# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :professor
  # belongs_to :course
  # belongs_to :user
  # has_many :tag

  # validates_presence_of :overall_rating, :letter_grade, :semester,
  # :year, on: :create, message: "can't be blank"
end
