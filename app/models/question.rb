# encoding: utf-8
class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::AutoId
  
  field :title, type: String
  attr_accessible :title
  
  validates :title, presence: { message: "这里可不能空着额"}
  belongs_to :user
  has_many :answers, :dependent => :delete
  has_and_belongs_to_many :related_players, class_name: "Player", inverse_of: :related_questions
  
  def related_players=(players)
    self.related_players.clear
    players.each do |p|
      self.related_players << Player.find(p) unless p.empty?
    end
  end
end
