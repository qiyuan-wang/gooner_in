# coding: utf-8 
class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::AutoId
  include Mongoid::Likeable
  field :content
  field :summary, type: String, default: ""
  belongs_to :user
  belongs_to :question
  scope :most_likes, order_by(:likes_count => -1 )
  scope :recent, order_by(updated_at: -1)
  
  paginates_per 10
  
  def modified_time
    return self.created_at.strftime("%y-%m-%d %k:%M:%S")
  end
  
  def question_title
    return self.question.title
  end
  
  def anchor
    "answer-#{self.id}"
  end
  
  def get_summary
    unless self.content.empty?
      self.summary = self.content.gsub(/<[^>]*>/, "").first(140)
    end
    self.touch
  end
  
  #标注喜欢
  def like_by(user)
    unless self.liked_by_user? user
      self.push(:liked_user_ids, user.id)
      self.inc(:likes_count, 1)
      #self.touch
    end
  end
  
  
  #取消喜欢
  def unlike_by(user)
    if self.liked_by_user? user
      self.pull(:liked_user_ids, user.id)
      self.inc(:likes_count, -1)
      #self.touch
    end
  end
  
  #获取点击喜欢的用户
  def liked_users_list
    User.where(:_id.in => self.liked_user_ids).limit(8).order_by(:created_at => -1)
  end
  
  #按喜欢时间排序后的用户列表 性能较差
  #!!需修改
  def liked_users_list_alt
    ordering = {}
    self.liked_user_ids.last(8).reverse.each_with_index {|id, i| ordering[id] = i }
    User.where(:_id.in => self.liked_user_ids).limit(8).sort_by{|o| ordering[o.id]}
  end
end
