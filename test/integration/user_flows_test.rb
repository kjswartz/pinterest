require 'test_helper'
require 'bcrypt'

class UserFlowsTest < ActionDispatch::IntegrationTest

  test "user signup, login and browse" do
    get '/users/new'
    assert_response :success

    post "/users", user: { about: 'about', avatar: 'avatar', email: 'tom@tom.com', location: 'tampa', name: 'tom', username: '12345', password: 'password' }
    assert_redirected_to user_path(session[:user_id])
    @user = User.find_by(id: session[:user_id])

    assert_equal @user.pins.count, 0

    get "/users/#{User.first.id}"
    assert_response :redirect

    get "/users/#{@user.id}"
    assert_response :success


    # 980190963

    # assert_equal session_signin_path, path
    # assert_equal 200, status
    # assert_equal "/home", path

    # get '/admin'
    # assert_equal 200, status
  end
end
