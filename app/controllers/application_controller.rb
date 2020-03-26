# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # helper_method :current_user
  # before_filter :current_user
  def authenticate
    redirect_to :login unless user_signed_in?
  end

private

def current_user
  @current_user ||= Authuser.find_by(id: session[:user_id])
end

helper_method :current_user

  def user_signed_in?
    # converts current_user to a boolean by negating the negation
    !!current_user
  end
end

