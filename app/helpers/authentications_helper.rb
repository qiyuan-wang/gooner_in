module AuthenticationsHelper
  def trim_info_from_auth(auth)
    hash = {:provider => auth['provider'], :authid => auth['uid'], :name => auth['nickname'], :url => auth['info']['urls']['Weibo']}
  end
end
