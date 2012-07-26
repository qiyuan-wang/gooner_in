class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  has_many :answers
  has_and_belongs_to_many :related_players, class_name: "Player", inverse_of: :related_questions
end
