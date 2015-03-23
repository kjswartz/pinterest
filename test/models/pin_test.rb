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

#validations
# validates :title, presence: true
# validates :image, presence: true
# validates :board_id, presence: true

require 'test_helper'

class PinTest < ActiveSupport::TestCase
    test "should not be able to save pin without a title, image, and board id" do
      pin = Pin.new
      pin.title = 'Title'
      assert_equal pin.save, false
    end
end
