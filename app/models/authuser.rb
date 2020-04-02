# frozen_string_literal: true

class Authuser < ApplicationRecord
  def self.find_or_create_from_auth_hash(auth)
    where(provider: auth['provider'], uid: auth['uid']).first_or_initialize
      .tap do |authuser|
      authuser.provider = auth['provider']
      authuser.uid = auth['uid']
      authuser.name = auth['info']['name']
      authuser.email = auth['info']['email']
      authuser.hosted_domain = auth['extra']['raw_info']['hd']
      authuser.location = auth['info']['location']
      authuser.image_url = auth['info']['image']
      authuser.save!
    end
  end

  acts_as_voter
end
