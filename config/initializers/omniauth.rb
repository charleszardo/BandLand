Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  # provider :facebook, ENV['527418710694771'], ENV['c684301c39719ae603406eea384f1b7e']
end