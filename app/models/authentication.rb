class Authentication
  include Mongoid::Document
  field :provider, type: String
  field :authid, type: Integer
  belongs_to :user
  scope :weibo, where(provider: "weibo")
  scope :qq, where(provider: "qq")
  
  def self.trim_info_from_auth(auth)
    hash = {:provider => auth['provider'], 
            :authid => auth['uid'], 
            :name => auth['info']['nickname'], 
            :url => auth['info']['urls']['Weibo']}
  end
  
end
