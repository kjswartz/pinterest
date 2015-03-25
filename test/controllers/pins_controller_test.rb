require 'test_helper'

class PinsControllerTest < ActionController::TestCase
  setup do
    # @pin = pins(:one)
    @current_user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :redirect
    assert_redirected_to search_pins_path
  end

  test "search working correctly" do
    get :search
    assert_response :success
    assert_equal pins.class, Array

  end

end
