class PostsController < ApplicationController
  def index
     @posts = Post.all
  end
  
  def new
    
  end
  
  def show
    puts params
    @post = Post[params["post_id"]]
  end
  
  def create
    puts "This is PostController < Application Controller create"
    puts params
    post_params
    
    if Post.new(params).valid?
      @post = Post.new(params)
      @post.saved  
      puts @post
      puts Post.inspect
      puts Post.last.inspect
      redirect_to post_path(Post.last.post_id)
    else
      render 'new'
      flash[:alert] = "An error occured whilst creating the post check 
      whether you have entered values in the title and body cells."
    end
  end
 
  private
 
  def post_params
    params.permit(:title, :body, :post_type)
  end
  
end
