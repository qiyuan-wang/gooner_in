class Player
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  include Mongoid::Timestamps
  
  field :name, type: String
  field :e_name, type: String
  field :nationality, type: String
  field :day_of_birth, type: Date
  field :position, type: String
  field :_id, type: String, default: ->{ e_name }
  
  has_and_belongs_to_many :related_questions, class_name: "Question", inverse_of: :related_players
  
end
