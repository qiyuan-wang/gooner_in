class Player
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  include Mongoid::Timestamps
  
  field :name, type: String
  field :e_name, type: String
  field :nationality, type: String
  field :day_of_birth, type: Date
  field :position, type: String
end
