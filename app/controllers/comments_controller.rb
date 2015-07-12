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
      redirect_to :back
      flash[:alert] = "Couldn't create a comment check whether you have written a name and some text"
    end
  end
  
  private
 
  def post_params
    params.permit(:name, :body, :post_id)
  end
    
  
end
