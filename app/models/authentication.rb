class Authentication
  include Mongoid::Document
  field :provider, type: String
  field :authid, type: Integer
  embedded_in :user
  scope :weibo, where(provider: "weibo")
  
  def self.trim_info_from_auth(auth)
    hash = {:provider => auth['provider'], 
            :authid => auth['uid'], 
            :name => auth['info']['nickname'], 
            :url => auth['info']['urls']['Weibo']}
  end
  
end
