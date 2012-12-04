#OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :weibo, "2424871994", "4e0c9f08ea04938276ca3c32913c1d72"
  provider :douban, "0a7ba095f168850a1f72e1c1d4398f1e", "d1a26d262cd03f2b"
  provider :qq_connect, "100340909", "3842dd1768a7fc0ab168facb1fa09ee3",
    scope: "get_info"
  
end