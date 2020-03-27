# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  fixtures :courses, :professors, :reviews
  setup do
    @review = reviews(:one)
    @professor = professors(:one)
    @course = courses(:one)
  end

  it 'should report the review' do
    post reviews_url,
         params: { review: { reason: 'other', other_input: 'Its really bad' } }
    expect(params[:reason]).to_not be nil
    expect(flash[:notice]).to_not be nil

    it 'sends an email' do
      expect { subject.send_instructions }.to change {
        ActionMailer::Base.deliveries.count
      }.by(1)
    end
  end
end
