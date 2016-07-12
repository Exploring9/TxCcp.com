require 'test_helper'
#I am using minitest so I start my tests with def
class MessagesControllerTest < ActionController::TestCase
  
  def test_should_get_the_new_page_for_message
    get :new
    assert_response :success
    assert_template "messages/new"
    assert_template layout: "layouts/application"
    assert_template layout: "layouts/application", partial: "_footer"
    assert_template layout: "layouts/application", partial: "_header" 
    assert_select 'div', "Name:"
    assert_select 'div', "Email:"
    assert_select 'div', "Content:"
    assert_select 'input'
    assert_select 'fieldset'
  end
  
  def test_should_get_the_post_page_for_message
    post :create
    assert_response :success
    assert_template "messages/new"
    assert_template layout: "layouts/application"
    assert_template layout: "layouts/application", partial: "_footer"
    assert_template layout: "layouts/application", partial: "_header" 
  end
  
  def test_flash_bad_message
    #Params is wrong
    post :create, params: {:name => "a",:email => "", :content => "s"}
    #assert_redirected_to(controller: "message", action: "new") 
    assert_equal "An error occurred while delivering this message.
      Check whether you have correctly written your name/email/content. (They can't be blank)", flash[:alert] 
  end
  
  def test_flash_good_message
    #Params is good
    post :create, params: {:name => "a",:email => "@", :content => "s"}
    #assert_redirected_to(controller: "message", action: "new") 
    assert_equal  "Your messages has been sent.", flash[:notice] 
  end
  
end
