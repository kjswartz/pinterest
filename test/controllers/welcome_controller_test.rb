require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get welcome index and application navbar partial" do
    get :index
    assert_template layout: "layouts/application", partial: "_navbar"
    assert_response :success
  end

end
