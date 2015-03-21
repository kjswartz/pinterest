require 'test_helper'
require 'bcrypt'

class UserFlowsTest < ActionDispatch::IntegrationTest
fixtures :users, :boards, :pins

  test "user signup, login and browse" do
    get '/users/new'
    assert_response :success

    # signs up a new user and logs in as that user
    post "/users", user: { about: 'about', avatar: 'avatar', email: 'tom@tom.com', location: 'tampa', name: 'tom', username: '12345', password: 'password' }
    assert_redirected_to user_path(session[:user_id])
    @user = User.find_by(id: session[:user_id])
    assert_equal @user.pins.count, 0

    # attempts to load a different users show page
    get "/users/#{User.first.id}"
    assert_response :redirect

    # attempts to go to admin section and is redirected to home screen
    get "/admin"
    assert_response :redirect

    # goes to current logged in users show page
    get "/users/#{@user.id}"
    assert_response :success

    # attempts to delete a pin that doesnt belong to user
    delete "/pins/#{Pin.first.id}"
    assert_response :redirect
  end
end
