require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "all pins should " do
    get :index
    assert_template layout: "layouts/application", partial: "_navbar"
    assert_response :success
  end

end
