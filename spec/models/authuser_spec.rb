require 'rails_helper'

RSpec.describe Authuser, type: :model do
  it "creates or updates itself from an oauth hash" do
  	auth = {
  	'provider' => 'google',
    'uid' => '12345',
    'info' => {
      'name' => 'John Doe',
      'email' => 'johndoe@doe.com',
      'location' => 'Doe World',
      'image' => 'image_url'
  	},
    'extra' => {
      	'raw_info' => {
        	'hd' => '@tamu.edu'
      		}
    	}
    }
	    Authuser.find_or_create_from_auth_hash(auth)
	    authuser = Authuser.first
	    expect(authuser.provider).to eq("google")
	    expect(authuser.uid).to eq("12345")
	    expect(authuser.email).to eq("johndoe@doe.com")
	    expect(authuser.name).to eq("John Doe")
	    expect(authuser.location).to eq("Doe World")
	  end
	end