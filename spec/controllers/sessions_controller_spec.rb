# frozen_string_literal: true

# sessions_controller_spec.rb
require 'spec_helper'
require 'rails_helper'
RSpec.describe SessionsController do
  auth = {
    'provider' => 'google',
    'uid' => '12345',
    'info' => {
      'name' => 'John Doe',
      'email' => 'johndoe@doe.com',
      'location' => 'Doe World',
      'image' => 'image_url'
    },
    'extra' => { 'raw_info' => { 'hd' => '@tamu.edu' } }
  }
  before { request.env['omniauth.auth'] = auth }

  describe '#create' do
    it 'should successfully create a user' do
      expect { post :create }.to change { Authuser.count }.by(1)
    end

    it 'should successfully create a session' do
      session[:user_id].should be_nil
      post :create
      session[:user_id].should_not be_nil
    end

    it 'should redirect the user to the root url' do
      post :create
      session[:user_id].should_not be_nil
      response.should redirect_to search_path
    end
  end

  describe '#destroy' do
    before { post :create }

    it 'should clear the session' do
      session[:user_id].should_not be_nil
      delete :destroy
      session[:user_id].should be_nil
    end

    it 'should redirect to the home page' do
      delete :destroy
      response.should redirect_to login_path
    end
  end
end
  