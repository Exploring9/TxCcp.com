require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def test_should_get_the_post_new_page
    get :new
    assert_response :success
    assert_template "posts/new"
    assert_template layout: "layouts/application"
    assert_template layout: "layouts/application", partial: "_footer"
    assert_template layout: "layouts/application", partial: "_header" 
    assert_select 'div', "Title:"
    assert_select 'div', "Body:"
    assert_select 'input'
    assert_select 'fieldset'
  end

  def test_should_get_the_post_index_page
    get :index
    assert_response :success
    assert_template "posts/index"
    assert_template layout: "layouts/application"
    assert_template layout: "layouts/application", partial: "_footer"
    assert_template layout: "layouts/application", partial: "_header" 
  end

  def test_get_the_show_page
    post :create, {:title => "a", :body => "s", :post_id => 1, :post_type => "General Taxation"}
    get :show, :post_id => 1
    assert_response :success
    assert_template "posts/show"
    assert_template layout: "layouts/application"
    assert_template layout: "layouts/application", partial: "_footer"
    assert_template layout: "layouts/application", partial: "_header" 
    assert_select 'h3', 'a'
    assert_select 'p', 's'
  end

  def test_flash_bad_post
    #Params is wrong
    post :create, {:title => nil, :body => "", :post_id => 2, :post_type => "General Taxation" }
    #assert_redirected_to(controller: "message", action: "new") 
    assert_equal  "An error occured whilst creating the post check 
      whether you have entered values in the title and body cells.", flash[:alert] 
  end

end
