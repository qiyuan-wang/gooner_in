# coding: utf-8
module PeopleHelper
  def provider_titlize provider
    if provider.eql? "weibo"
      "微博"
    elsif provider.eql? "douban"
      "豆瓣"
    elsif provider.eql? "qq_connect"
      "腾讯QQ"
    end
  end
end
