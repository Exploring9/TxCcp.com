class MessagesController < ApplicationController

  def new
  end

  def create
    puts "This is MessagesController < ApplicationController"
    puts params
    message_params()
    #This is called to check whether the parameters are correct (Per sequel)
    if Message.new(params).valid?
      @message = Message.new(params)
      @message.saved
      send_message()
      redirect_to messages_path, notice: "Your messages has been sent."
    else 
      puts "Not valid"
      render :new
      flash[:alert] = "An error occurred while delivering this message.
      Check whether you have correctly written your name/email/content. (They can't be blank)"
    end
  end
  
  def send_message()
      MessageMailer.new_message(@message).deliver_now
  end

private

  def message_params
    params.permit(:name, :email, :content)    
  end

end
