require 'test_helper'

class PinsControllerTest < ActionController::TestCase
  setup do
    @pin = pins(:one)
    @new_pin = pins(:two)
    @current_user = users(:one)
  end

  test "should get index" do
    get :index
    # assert_response :redirect
    # assert_redirected_to(controller: "pins", :action => 'search')
    assert_redirected_to search_pins_path
    # assert_not_nil assigns(:pins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pin" do
    assert_difference('Pin.count') do
      post :create, pin: { board_id: @pin.board_id, description: @pin.description, image: @pin.image, title: @pin.title, url: @pin.url }
    end

    assert_redirected_to pin_path(assigns(:pin))
  end

  test "should show pin" do
    get :show, id: @pin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pin
    assert_response :success
  end

  test "should update pin" do
    patch :update, id: @pin, pin: { board_id: @pin.board_id, description: @pin.description, image: @pin.image, title: @pin.title, url: @pin.url }
    assert_redirected_to pin_path(assigns(:pin))
  end

  test "should destroy pin" do
    assert_difference('Pin.count', -1) do
      delete :destroy, id: @pin
    end

    assert_redirected_to pins_path
  end
end
