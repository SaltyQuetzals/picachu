# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logins', type: :request do
  it 'should get index page' do
    get login_url
    expect(response).to have_http_status(:success)
  end
end
