# frozen_string_literal: true

INCLUSION_VALIDATION_FAILED_MSG = '%<value>s is not a valid choice.'

class Review < ApplicationRecord
  STRONGLY_DISAGREE = 1
  STRONGLY_AGREE = 5
  STRONGLY_DISAGREE_TO_STRONGLY_AGREE =
    (STRONGLY_DISAGREE..STRONGLY_AGREE).freeze
  SEMESTERS = %w[Spring Summer Fall].freeze
  LETTER_GRADES = %w[A B C D F Q S U].freeze
  COURSE_FORMAT = %w[Exam Project Homework].freeze

  validates :overall_rating,
            inclusion: {
              in: STRONGLY_DISAGREE_TO_STRONGLY_AGREE,
              message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :letter_grade,
            inclusion: {
              in: LETTER_GRADES, message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :semester,
            inclusion: {
              in: SEMESTERS, message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :year,
            inclusion: {
              in: 2_000..Date.today.year,
              message: INCLUSION_VALIDATION_FAILED_MSG
            }

  validates :interesting,
            inclusion: {
              in: STRONGLY_DISAGREE_TO_STRONGLY_AGREE,
              message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :difficult,
            inclusion: {
              in: STRONGLY_DISAGREE_TO_STRONGLY_AGREE,
              message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :course_format,
            inclusion: {
              in: COURSE_FORMAT, message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :cared_about_material,
            inclusion: {
              in: STRONGLY_DISAGREE_TO_STRONGLY_AGREE,
              message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :open_to_questions,
            inclusion: {
              in: STRONGLY_DISAGREE_TO_STRONGLY_AGREE,
              message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :cared_about_students,
            inclusion: {
              in: STRONGLY_DISAGREE_TO_STRONGLY_AGREE,
              message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :clear_grading,
            inclusion: {
              in: STRONGLY_DISAGREE_TO_STRONGLY_AGREE,
              message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :homework_heavy,
            inclusion: {
              in: STRONGLY_DISAGREE_TO_STRONGLY_AGREE,
              message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :clear_explanations,
            inclusion: {
              in: STRONGLY_DISAGREE_TO_STRONGLY_AGREE,
              message: INCLUSION_VALIDATION_FAILED_MSG
            }
  validates :fast_grading,
            inclusion: {
              in: STRONGLY_DISAGREE_TO_STRONGLY_AGREE,
              message: INCLUSION_VALIDATION_FAILED_MSG
            }

  belongs_to :professor
  belongs_to :course

  acts_as_votable
end
