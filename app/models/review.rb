# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :professor
  belongs_to :course
end
