Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           ENV['GOOGLE_CLIENT_ID'],
           ENV['GOOGLE_CLIENT_SECRET'],
           {hd: "tamu.edu"} # hd = hosted domains. See https://github.com/zquestz/omniauth-google-oauth2/blob/master/README.md#configuration
end	
