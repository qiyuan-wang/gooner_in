# encoding: utf-8
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
  field :join_year, type: Date
  field :leave_year, type: Date
  field :leaved, type: Boolean, default: false

  mount_uploader :avatar, PlayerAvatarUploader
  
  has_and_belongs_to_many :related_questions, class_name: "Question", inverse_of: :related_players
  
  def join
    self.join_year.year
  end
  
  def leave
    if self.leaved
      self.leave_year.year
    else
      "至今"
    end
  end
  
end
