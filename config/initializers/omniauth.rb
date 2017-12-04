Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, "f0951aa9d7b39e0ffcfe", "c73d2b9973f8c65953f8fba490c27cb3850bc229"
end
