require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get about_us" do
    get :about_us
    assert_response :success
  end

  test "should get terms_and_conditions" do
    get :terms_and_conditions
    assert_response :success
  end

end
