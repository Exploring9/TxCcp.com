require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  def test_should_get_about_us
    get :about_us
    assert_response :success
    assert_template "static_pages/about_us"
    assert_template layout: "layouts/application"
    assert_template layout: "layouts/application", partial: "_footer"
    assert_template layout: "layouts/application", partial: "_header"
  end

  def test_should_get_terms_and_conditions
    get :terms_and_conditions
    assert_response :success
    assert_template "static_pages/terms_and_conditions"
    assert_template layout: "layouts/application"
    assert_template layout: "layouts/application", partial: "_footer"
    assert_template layout: "layouts/application", partial: "_header"    
  end
  
end
