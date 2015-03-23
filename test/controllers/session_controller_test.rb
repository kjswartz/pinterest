require 'test_helper'

class SessionControllerTest < ActionController::TestCase

  test "should get signin" do
    post :signin, email: users(:one).email, password: users(:one).password
    assert_response :redirect
  end

  test "should get signout" do
    delete :signout
    assert_response :success
  end

end
