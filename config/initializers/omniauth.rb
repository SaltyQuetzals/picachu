Rails.application.config.middleware.use OmniAuth::Builder do
open('.env', 'r').readlines.each {|l| kv = l.split('='); ENV[kv[0]] = kv[1];}
  provider :google_oauth2,
           ENV['GOOGLE_CLIENT_ID'],
           ENV['GOOGLE_CLIENT_SECRET'],

           {hd: "tamu.edu"} # hd = hosted domains. See https://github.com/zquestz/omniauth-google-oauth2/blob/master/README.md#configuration
end	
