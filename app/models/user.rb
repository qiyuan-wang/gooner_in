# encoding: utf-8
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name,    type: String
  field :email,   type: String

  mount_uploader :avatar, AvatarUploader
  
  attr_accessible :name, :email, :password, :password_confirmation, :avatar, :avatar_cache, :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar
  #after_update :delete_original_file
  
  authenticates_with_sorcery!

  validates :name, :presence => { message: "不能为空" },
                   :uniqueness => { :case_sensitive => false, message: "此用户名已被注册了，换个吧"},
                   :length => { maximum: 10, too_long: "用户名过长（最多支持10位字符）"},
                   :format => { with: /\A[\w\u4e00-\u9fa5]+\z/, message: "用户名支持中英文字符和_(下划线)" }
  validates :email, :presence => { message: "不能为空" },
                    :uniqueness => { :case_sensitive => false, message: "此Email已被注册了，换个吧"},
                    :format => { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Email可不长这样" }
  validates :password, :presence => { on: :create, message: "不能为空" }, 
                       :confirmation => { message: "与确认密码不匹配" },
                       :length => { minimum: 6, too_short: "密码过短(最少为6位字符)" }
  has_many :questions
  has_many :answers
  
  #统计获得喜欢数
  def total_likes
    total_likes = 0
    self.answers.each do |a|
      total_likes += a.likes_count
    end
    total_likes
  end
  
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end
  
  def delete_original_file
    File.delete self.original_file_path if File.exists? self.original_file_path
  end
end
