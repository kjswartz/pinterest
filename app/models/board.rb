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

  scope :created_at, -> { order('created_at asc') }
  scope :updated_at, -> { order('updated_at desc') }
  scope :id, -> { order('id asc')}

end
