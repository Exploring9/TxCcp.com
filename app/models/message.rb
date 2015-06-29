Sequel::Model.plugin(:validation_helpers)
class Message < Sequel::Model
  plugin :validation_helpers
  attr_accessor :name, :email, :content
  
  def initialize(params)  
    puts "I am in class Message < Sequel::Model"  
    @name =     params[:name]
    @email =    params[:email]
    @content =  params[:content]
  end  
  
  def save()
    puts "Message save"
    Message.insert(:name=> self.name,:email=>self.email,:content=>self.content)
  end
  
  def validate()
    puts "This is Sequel validate"
    super 
    validates_type String, [:name, :content, :email]
    validates_presence [:name]
    validates_format /@/, :email
    
  end 
end