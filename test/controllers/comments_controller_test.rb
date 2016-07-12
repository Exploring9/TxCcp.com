require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  def test_good_comment_passes
    post :create, params: {:name => "a", :body => "a", :post_id => 1 } 
    assert_response :redirect
  end
  
  def test_bad_comment_fails
    @request.headers["HTTP_REFERER"] = "http://localhost:3000/posts/1"
    post :create, params: {:name => "a", :body => "a", :post_id => nil } 
    assert_response :redirect
    assert_equal  "Couldn't create a comment check whether you have written a name and some text", flash[:alert] 
    #Redirect issues -> It is being depreciated but it is related to the flash[:alert] according to the console so I need to check once Rails 5.1 is out on what the possible solutions
  end
  
end
