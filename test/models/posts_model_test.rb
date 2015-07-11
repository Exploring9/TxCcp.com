require 'test_helper'

class PostsModelTest < ActiveSupport::TestCase
  
  def test_no_posts_without_the_required_stuff
      assert_not Post.new(:title => "",:body => "@").valid?,
      "A post without a title shouldn't be validated"
      assert_not Post.new(:title => "a",:body => "").valid?,
      "A post without a body shouldn't be validated"     
      assert Post.new(:title => "a", :body => "a").valid?
  end
  
  
end