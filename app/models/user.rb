class User < ActiveRecord::Base
  has_many :boards
  has_many :pins, through: :boards
end
