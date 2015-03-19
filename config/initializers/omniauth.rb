OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Mntc::Application.config.fb_key, Mntc::Application.config.fb_secret
end