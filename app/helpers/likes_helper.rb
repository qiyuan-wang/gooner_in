# coding: utf-8
module LikesHelper
  # 喜欢功能
  # 参数
  # likeable - 喜欢的对象 当前为answer
  def likeable_tag(likeable)
    return "" if likeable.blank?
    
    if likeable.likes_count == 0
      label = "喜欢"
    else
      label = "#{likeable.likes_count}人喜欢"
    end
    
    if current_user && likeable.liked_by_user?(current_user)
      title = "取消喜欢"
      state = "liked"
      icon = content_tag("i", "", :class => "icon small_liked")
      method = :delete
    else
      title = "喜欢"
      state = ""
      icon = content_tag("i", "", :class => "icon small_like")
      method = :post
    end
    
    like_label = raw "#{icon} <span>#{label}</span>"
    link_to(like_label,"#",:title => title, 'data-count' => likeable.likes_count,
                'data-state' => state,'data-type' => likeable.class,'data-id' => likeable.id,
                :class => 'btn btn-small', :onclick => "return Like.likeable(this);")
  end
end
    
    
    