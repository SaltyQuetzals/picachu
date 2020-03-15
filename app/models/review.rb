# frozen_string_literal: true

LOWEST_RATING = 1
HIGHEST_RATING = 5
INVALID_CHOICE = '%<value> is not a valid choice.'

class Review < ApplicationRecord
  belongs_to :professor
  belongs_to :course

  validates :overall_rating,
            inclusion: {
              in: LOWEST_RATING..HIGHEST_RATING, message: INVALID_CHOICE
            }
  validates :letter_grade, inclusion: { in: %w[A B C D F Q S U] }
  validates :semester, inclusion: { in: %w[Spring Summer Fall] }
  validates :year, inclusion: { in: 2_000..Date.today.year }

  validates :interesting,
            inclusion: {
              in: LOWEST_RATING..HIGHEST_RATING, message: INVALID_CHOICE
            }
  validates :difficult,
            inclusion: {
              in: LOWEST_RATING..HIGHEST_RATING, message: INVALID_CHOICE
            }

  validates :course_format,
            inclusion: {
              in: %w[exam project homework], message: INVALID_CHOICE
            }
  validates :cared_about_material,
            inclusion: {
              in: LOWEST_RATING..HIGHEST_RATING, message: INVALID_CHOICE
            }
  validates :open_to_questions,
            inclusion: {
              in: LOWEST_RATING..HIGHEST_RATING, message: INVALID_CHOICE
            }
  validates :cared_about_students,
            inclusion: {
              in: LOWEST_RATING..HIGHEST_RATING, message: INVALID_CHOICE
            }
  validates :clear_grading,
            inclusion: {
              in: LOWEST_RATING..HIGHEST_RATING, message: INVALID_CHOICE
            }
  validates :homework_heavy,
            inclusion: {
              in: LOWEST_RATING..HIGHEST_RATING, message: INVALID_CHOICE
            }
  validates :clear_explanations,
            inclusion: {
              in: LOWEST_RATING..HIGHEST_RATING, message: INVALID_CHOICE
            }
  validates :fast_grading,
            inclusion: {
              in: LOWEST_RATING..HIGHEST_RATING, message: INVALID_CHOICE
            }
end
