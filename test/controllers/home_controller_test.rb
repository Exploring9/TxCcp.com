require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_template "home/index"
    assert_template layout: "layouts/application"
    assert_template layout: "layouts/application", partial: "_footer"
    assert_template layout: "layouts/application", partial: "_header" 
  end

end
