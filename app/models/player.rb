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
  field :join, type: Date
  field :leave, type: Date

  mount_uploader :avatar, PlayerAvatarUploader
  
  has_and_belongs_to_many :related_questions, class_name: "Question", inverse_of: :related_players
  
  def join_year
    self.join.year
  end
  
  def leave_year
    if self.leave.year == Time.now.year
      "至今"
    else
      self.leave.year
    end
  end
  
end
