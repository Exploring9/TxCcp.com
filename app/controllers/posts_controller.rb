class PostsController < ApplicationController
  def index
     @posts = Post.all
  end
  
  def new
  end
  
  def edit
    @post_information = PostsHelper::find_the_post(params["post_id"])
  end
  
  def save_edit
#    puts params; puts params["post_id"]
    if Post.new(params).valid? 
      PostsHelper::update_post(params)
      redirect_to post_path(params["post_id"])
    else
      redirect_to :action => "edit", :post_id => params["post_id"]
      flash[:alert] = "An error occured whilst updating the post check 
      whether you have entered values in the title and body cells."
    end   
  end
  
  def show
    puts params
    @post = Post[params["post_id"]]
  end
  
  def create
    puts "This is PostController < Application Controller create"
    puts params #post_params
    if Post.new(params).valid?
      PostsHelper::save_post(params)
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
