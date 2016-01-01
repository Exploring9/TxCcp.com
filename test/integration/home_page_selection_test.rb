require 'test_helper'

class HomePageSelectionTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "home page is there" do
    https!
    get "/"
    assert_response :success
  end
end
