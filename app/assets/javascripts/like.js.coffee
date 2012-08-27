window.Like = 
  likeable: (el) ->
    $el = $(el)
    likeable_type = $el.data("type")
    likeable_id = $el.data("id")
    likes_count = parseInt($el.data("count"))
    if $el.data("state") != "liked"
      $.ajax
        url : "/answers/#{likeable_id}/like"
        type : "POST"
        data :
          type : likeable_type
          id : likeable_id

      likes_count += 1
      $el.data('count', likes_count)
      Like.likeableAsLiked(el)
    else
      $.ajax
        url : "/answers/#{likeable_id}/like"
        type : "DELETE"
        data :
          type : likeable_type
          
      if likes_count > 0
        likes_count -= 1
      $el.data("state","").data('count', likes_count).attr("title", "喜欢")
      if likes_count == 0
        $('span',el).text("喜欢")
      else
        $('span',el).text("#{likes_count}人喜欢")
      $("i.icon",el).attr("class","icon small_like")
    false

  likeableAsLiked: (el) ->
    likes_count = $(el).data("count")
    $(el).data("state","liked").attr("title", "取消喜欢")
    $('span',el).text("#{likes_count}人喜欢")
    $("i.icon",el).attr("class","icon small_liked")