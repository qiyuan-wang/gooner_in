class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::AutoId
  field :content
  
  belongs_to :user
  belongs_to :question
end
