# coding: utf-8 
class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::AutoId
  include Mongoid::Likeable
  field :content
  
  belongs_to :user
  belongs_to :question
  
  def updated_time
    self.updated_at.to_date
  end
  
  #标注喜欢
  def like_by(user)
    unless self.liked_by_user? user
      self.push(:liked_user_ids, user.id)
      self.inc(:likes_count, 1)
      self.touch
    end
  end
  
  #取消喜欢
  def unlike_by(user)
    if self.liked_by_user? user
      self.pull(:liked_user_ids, user.id)
      self.inc(:likes_count, -1)
      self.touch
    end
  end
end
