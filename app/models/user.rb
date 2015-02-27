class User < ActiveRecord::Base
  #carrierwave
  mount_uploader :avatar, AvatarUploader

  #associations
  has_many :boards
  has_many :pins, through: :boards

  #validations
  
end
