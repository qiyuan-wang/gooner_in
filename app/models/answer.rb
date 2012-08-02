class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::AutoId
  field :content
  
  belongs_to :user
  belongs_to :question
  
  def updated_time
    self.updated_at.to_date
  end
end
