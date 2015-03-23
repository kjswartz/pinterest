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
#validations
# validates :name, presence: true

require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "board does not save without a name" do
    board = Board.new
    assert_equal board.save, false
  end
end
