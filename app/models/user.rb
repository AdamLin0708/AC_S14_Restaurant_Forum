class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name         

  mount_uploader :avatar, AvatarUploader


  #User relationship with Restaurant through comment
  has_many :comments, dependent: :restrict_with_error  
  has_many :commented_restaurants, through: :comments, source: :restaurant

  #User relationship with Restaurant through favortie     
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  #User relationship with Restaurant through like     
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  #User following
  has_many :followships, dependent: :destroy
  # has_many :followships, through: :followships, source: :following
  has_many :followings, through: :followships


  def admin?
    self.role == 'admin'
  end         
end
