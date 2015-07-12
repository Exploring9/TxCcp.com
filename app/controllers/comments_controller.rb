class CommentsController < ApplicationController 

  def create
    puts params
    post_params
    
    if Comment.new(params).valid?
      @comment = Comment.new(params)
      @comment.saved
      puts @comment.inspect
      puts @comment.post_id
      redirect_to post_path(@comment.post_id)
    else 
      render 'new'
      flash[:alert] = "Error"
    end
  end
  
  #These methods will be deleted
  def index
     @comments = Comments.all
  end
  
  def new
    
  end
  
  def show
    puts params
    @comment = Comment[params["comment_id"]]
  end  
  
  private
 
  def post_params
    params.permit(:name, :body)
  end
    
  
end
