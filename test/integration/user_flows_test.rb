require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "user login and browses" do
    https!
    get root_path
    assert_response :success

    post_via_redirect "/session/signin", email: users(:one).email, password: users(:one).password
    assert_equal session_signin_path, path
  end
end
