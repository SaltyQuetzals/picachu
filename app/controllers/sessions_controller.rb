# frozen_string_literal: true
class SessionsController < ApplicationController
  def create
    @authuser =
      Authuser.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = @authuser.id
    redirect_to :search
  end

  def destroy
    session[:user_id] = nil
    session.clear
    reset_session
    current_user = nil
    flash[:success] = 'See you!'
    redirect_to :login
  end
end
