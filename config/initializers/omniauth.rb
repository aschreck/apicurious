Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['GITHUB_API_KEY'], ENV['GITHUB_SECRET_KEY']
end
