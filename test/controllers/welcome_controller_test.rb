require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get welcome index and application navbar partial" do
    get :index
    assert_template layout: "layouts/application", partial: "_navbar"
    assert_response :success
    assert_not_nil assigns(:pins) # makes sure that a @pins instance variable was set
  end

  test "links to pins works" do
    assert_generates('/pins/1', {:controller => 'pins', :action => 'show', :id => '1'})
  end

end
