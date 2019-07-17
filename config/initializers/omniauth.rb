Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :github, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end