class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::AutoId
  
  field :title, type: String
  
  validates :title, presence: true
  has_many :answers, :dependent => :delete
  has_and_belongs_to_many :related_players, class_name: "Player", inverse_of: :related_questions
  
  def related_players=(players)
    self.related_players.clear
    players.each do |p|
      self.related_players << Player.find(p) unless p.empty?
    end
  end
end
