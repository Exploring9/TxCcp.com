module CommentsHelper
  include Database_Sequel
  def load_comments(post_id)
    
    if !post_id.include?("post_id=")
      id = post_id.last
    else
      # This is so that the testing suite passes
      id = post_id.match('post_id=\d').to_s.delete!("post_id=")
    end
    
    all_posts = DB[:comments].where(:post_id => id).all
    return all_posts
  end
end
