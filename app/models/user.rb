# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  username   :string
#  email      :string
#  avatar     :string
#  location   :string
#  about      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  #carrierwave
  mount_uploader :avatar, AvatarUploader

  #associations
  has_many :boards, dependent: :destroy
  has_many :pins, through: :boards

  #validations
  validates :name, presence: true
  validates :email, presence: true
  validates :username, uniqueness: true

  scope :updated_at, -> { order('updated_at desc') }
  scope :recent, -> { order('updated_at desc').first }


end
