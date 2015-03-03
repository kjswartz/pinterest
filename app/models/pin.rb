# == Schema Information
#
# Table name: pins
#
#  id          :integer          not null, primary key
#  board_id    :integer
#  title       :string
#  description :text
#  url         :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Pin < ActiveRecord::Base
  #carrierwave
  mount_uploader :image, ImageUploader

  #association
  belongs_to :board

  #validations
  validates :title, presence: true
  validates :image, presence: true
  validates :board_id, presence: true

  #scope
  # scope :created_at, -> { where(created: true) }

  scope :latest_pin, -> { order("pins.created_at desc") }

  def self.first_pin
    order('created_at asc').first
  end

end
