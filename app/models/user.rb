# encoding: utf-8
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  field :name,    type: String
  field :email,   type: String
  field :description, type: String, default: ""
  field :weibo,   type: Integer, default: 0 # 0:未绑定 1:已注册用户绑定, 2:通过微博注册
  field :url, type: String

  mount_uploader :avatar, AvatarUploader
  
  attr_accessible :name, :email, :password, :password_confirmation, :avatar, :avatar_cache, :crop_x, :crop_y, :crop_w, :crop_h
  attr_protected :provider, :weibo, :authid
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar
  
  authenticates_with_sorcery!

  validates :name, :presence => { message: "别空着啊这儿" },
                   :uniqueness => { :case_sensitive => false, message: "下手晚了，此用户名已被注册了，换个吧"},
                   :length => { maximum: 10, too_long: "用户名过长（最多支持10个字符）"},
                   :format => { with: /\A[\w\u4e00-\u9fa5]+\z/, message: "用户名支持中英文字符和_(下划线)" }
  validates :email, :presence => { message: "这不能空着" },
                    :uniqueness => { :case_sensitive => false, message: "晚了，此Email已被注册了，换个吧"},
                    :format => { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Email可不长这样" }
  validates :password, :presence => { on: :create, message: "这儿也不能空着" }, 
                       :confirmation => { message: "与确认密码不匹配" },
                       :length => { minimum: 6, too_short: "密码别太短啊(最少为6位字符)" }

  has_many :questions
  has_many :answers
  has_many :authentications
    
  #统计获得喜欢数
  def total_likes
    total_likes = 0
    self.answers.each do |a|
      total_likes += a.likes_count
    end
    total_likes
  end
  
  def admin?
    APP_CONFIG['key_name'].include?(self.name)
  end
  
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end
end
