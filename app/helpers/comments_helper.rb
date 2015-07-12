module CommentsHelper
  include Database_Sequel
  def load_comments(post_id)
    all_posts = DB[:comments].where(:post_id => post_id).all
    return all_posts
  end
end
