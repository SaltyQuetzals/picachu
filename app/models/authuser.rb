class Authuser < ApplicationRecord
	def self.find_or_create_from_auth_hash(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |authuser|
			authuser.provider = auth.provider
			authuser.uid = auth.uid
			authuser.first_name = auth.info.first_name
			authuser.last_name = auth.info.last_name
			authuser.email = auth.info.email
			authuser.picture = auth.info.image
			authuser.hosted_domain = auth.extra.raw_info.hd
			authuser.save!
		end
	end
end