module PostsHelper
  include CommentsHelper
  def count_comments(post_id)
    all_posts = load_comments(post_id)
    number_posts = all_posts.count
    return number_posts
  end
  
  def self.find_the_post(post_id)
#    puts "This is PostsHelper#find_the_post";   puts post_id
#    puts Database_Sequel::DB[:posts].where(:post_id => post_id).all
    post =  Database_Sequel::DB[:posts].where(:post_id => post_id).all
#    puts post.class;    puts post[0].class
    @title =  post[0][:title]
    @body = post[0][:body]
    @post_type = post[0][:post_type]
    return {:title => @title, :body => @body, :post_type => @post_type}
  end
  
  def self.update_post(params)
    puts params
    Database_Sequel::DB[:posts].where(:post_id => params["post_id"]).update(:title => params["title"], :body => params["body"])
  end
  
  def self.save_post(params)
      @post = Post.new(params)
      @post.saved  
      puts @post; puts Post.inspect; puts Post.last.inspect
  end
end
