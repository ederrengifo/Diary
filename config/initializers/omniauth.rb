OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1815841271971998', '350719c8ec9e26c1bb4da0615e4bedcf'
end
