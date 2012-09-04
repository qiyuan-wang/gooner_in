# encoding: utf-8
class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::AutoId
  
  field :title, type: String
  field :answered_users, type: Array, default: []
  attr_accessible :title
  
  validates :title, presence: { message: "这里可不能空着额"}
  belongs_to :user
  has_many :answers, :dependent => :delete
  has_and_belongs_to_many :related_players, class_name: "Player", inverse_of: :related_questions
  
  def add_related_players(players)
    players.each do |p|
      self.related_players << Player.find(p) unless p.empty?
    end
  end
  
  def update_related_players(players)
    self.related_players.clear
    self.add_related_players(players)
  end
  
  def modified?
    self.updated_at > self.created_at
  end
  
  def modified_time
    return self.updated_at
  end
  
  def asked_by?(user)
    self.user_id == user.id
  end
  
  def answered_by(user)
    unless answered_by? user
      self.push(:answered_users, user.id)
      self.touch
    end
  end
  
  def answered_by?(user)
    self.answered_users.include? user.id
  end
end
