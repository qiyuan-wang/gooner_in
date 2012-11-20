class Authentication
  include Mongoid::Document
  field :provider, type: String
  field :authid, type: Integer
  field :weibo,   type: Integer, default: 0 # 0:未绑定 1:已注册用户绑定, 2:通过微博注册
  field :url, type: String
  embedded_in :user
  
  def create_with_auth(auth)
    authentication = Authentication.create(:provider => auth['provider'], :authid => auth['uid'], :url => auth['info']['urls']['Weibo'])
    authentication.save
  end
end
