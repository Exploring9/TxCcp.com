module PostsHelper
  include CommentsHelper
  def count_comments(post_id)
    all_posts = load_comments(post_id)
    number_posts = all_posts.count
    return number_posts
  end
end
