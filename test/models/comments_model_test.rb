require 'test_helper'

class CommentsModelTest < ActiveSupport::TestCase
  
  def test_no_comment_without_the_required_stuff
      assert_not Comment.new(:name => "",:body => "@", :post_id => "1").valid?,
      "A comment without a name shouldn't be validated"
      assert_not Comment.new(:name => "a",:body => "", :post_id => "1").valid?,
      "A comment without a body shouldn't be validated" 
      assert_not Comment.new(:name => "a",:body => "a", :post_id => nil).valid?,
      "A comment without a :post_id shouldn't be validated"           
      assert Comment.new(:name => "a",:body => "z", :post_id => "1").valid?
  end
  
  
end