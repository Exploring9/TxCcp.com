require 'test_helper'

class PostsModelTest < ActiveSupport::TestCase
  
  def test_no_posts_without_the_required_stuff
      assert_not Post.new(:title => "",:body => "@", :post_type => "General Taxation").valid?,
      "A post without a title shouldn't be validated"
      assert_not Post.new(:title => "a",:body => "", :post_type => "General Taxation").valid?,
      "A post without a body shouldn't be validated"     
      assert Post.new(:title => "a", :body => "a", :post_type => "General Taxation").valid?,
      "Good Post"
  end
  
  
end