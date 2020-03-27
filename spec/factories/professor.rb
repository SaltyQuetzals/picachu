# frozen_string_literal: true

FactoryBot.define do
  factory :professor do
    first_name { 'John' }
    last_name { 'Doe' }
    full_name { "#{first_name} #{last_name}" }
    display_name { "#{first_name} #{last_name}" }
  end
end
