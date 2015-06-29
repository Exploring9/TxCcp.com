class MessageMailer < ActionMailer::Base

  default from: "Your Mailer <raikutis@gmail.com>"
  default to: "Your Name <raikutis@gmail.com>"

  def new_message(message)
    puts "This is MessageMailer < ActionMailer::Base"
    puts message
    @message = message
    
    mail subject: "Message from #{message.name} - TAXCP.COM"
  end

end