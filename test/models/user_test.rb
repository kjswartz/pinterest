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

#validations
# validates :name, presence: true
# validates :email, presence: true
# validates :username, uniqueness: true
# validates :password, length: { minimum: 6 }

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save without name, unique username, email and 6 character long password" do
    user = User.new
    assert_equal user.save, false
  end
end
