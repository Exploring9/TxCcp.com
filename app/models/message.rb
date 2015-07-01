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
  
  def saved()
    puts "Message save"
    Message.insert({:name=> self.name,:email=>self.email,:content=>self.content,
       :create => Time.now, :update => Time.now})
  end
  
  def validate
    puts "This is Sequel validate"
    super 
    validates_type String, [:name, :content, :email]
    validates_presence [:name, :content, :email]
    validates_format /@/, :email
  end 
end