class Restaurant < ApplicationRecord
  mount_uploader :image, PhotoUploader
  validates_presence_of :name
  belongs_to :category, optional: true
  has_many :comments, dependent: :destroy
  has_many :favorite, dependent: :destroy
  has_many :favorited_users, through: :favorite, source: :user

end
