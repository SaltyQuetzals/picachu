# frozen_string_literal: true

FactoryBot.define do
  factory :authuser do
    provider { 'google' }
    uid { '123545' }
    name { 'James Doe' }
    email { 'jamesdoe@doe.com' }
    location { 'Doe World' }
    image_url { 'image_url' }
  end
end
