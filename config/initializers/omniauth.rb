#OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :weibo, "2424871994", "4e0c9f08ea04938276ca3c32913c1d72"
  provider :douban, "08fecc7d9ccbca8f1afc6578d6635fad", "b8c822bfdca1d12a"
end