Rails.application.config.middleware.use OmniAuth::Builder do
  provider:facebook, ENV['467189170791489'], ENV['a5891d0a8795010f850c7b1b2b68014b']
end