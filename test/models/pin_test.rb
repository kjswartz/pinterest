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

require 'test_helper'

class PinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
