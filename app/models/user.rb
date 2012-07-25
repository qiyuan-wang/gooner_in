# encoding: utf-8
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name,    type: String
  field :email,   type: String
  
  attr_accessible :name, :email, :password, :password_confirmation
  authenticates_with_sorcery!

  validates :name, :email, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :name, length: { minimum: 1, maximum: 10 }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  validates_format_of :name, with: /\A[\w\u4e00-\u9fa5]+\z/
  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates :password, length: { minimum: 6 }

end
