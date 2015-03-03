# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Board < ActiveRecord::Base
  belongs_to :user
  has_many :pins, dependent: :destroy

  #validations
  validates :name, presence: true


  def self.updated_board
    order('updated_at desc')
  end

  def self.latest_board
    order('created_at desc').first
  end

  def self.first_board
    order('created_at asc').first
  end

end
