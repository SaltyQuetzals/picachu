# sessions_controller_spec.rb
require 'spec_helper'
require 'rails_helper'
RSpec.describe SessionsController do
  describe '#create' do
    it 'should successfully create a session' do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]

      session[:user_id].should be_nil
    end

    it 'should redirect the user to the search page' do
      response.should be_successful
    end
  end

  describe '#destroy' do
    before { '#create' }

    it 'should clear the session' do
      delete :destroy
      session[:user_id].should be_nil
    end

    it 'should redirect to the home page' do
      delete :destroy
      response.should redirect_to :login
    end
  end
end
