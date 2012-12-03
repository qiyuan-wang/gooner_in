class Authentication
  include Mongoid::Document
  field :provider, type: String
  field :authid, type: Integer
  field :url, type: String
  belongs_to :user
  scope :weibo, where(provider: "weibo")
  scope :qq, where(provider: "qq")
  scope :douban, where(provider: "douban")
  
  def self.trim_info_from_auth(auth)
    if auth['provider'] == "weibo"
      hash = {:provider => auth['provider'], 
              :authid => auth['uid'], 
              :name => auth['info']['nickname'], 
              :url => auth['info']['urls']['Weibo']}
    elsif auth['provider'] == "douban"
      hash = {:provider => auth['provider'], 
              :authid => auth['uid'], 
              :name => auth['info']['name'],
              :url => auth['info']['alt']}
    end
  end
end
