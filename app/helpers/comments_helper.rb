module CommentsHelper
  include Database_Sequel
  def comments_test(post_id)
    puts "Hey this is a test"
    puts post_id
    all_posts = DB[:comments].where(:post_id => post_id).all
    return all_posts
  end
end
