module CommentsHelper
  include Database_Sequel
  def load_comments(post_id)

    if defined?(!post_id.params)
      id = post_id.params["post_id"].to_i
    else 
      raise "Error"
    end
    
    puts "CommentsHelper#load_comments: This is the ID:#{id} and post_id:#{post_id}"
    all_posts = DB[:comments].where(:post_id => id).all
    return all_posts
  end
end
