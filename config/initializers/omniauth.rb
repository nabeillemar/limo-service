 Rails.application.config.middleware.use OmniAuth::Builder do
      provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], {:provider_ignores_state => true}
 end
 
OmniAuth.config.allowed_request_methods = %i[get]