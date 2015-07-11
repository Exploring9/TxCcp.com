Sequel::Model.plugin(:validation_helpers)
class Post < Sequel::Model
  plugin :validation_helpers
  attr_accessor :title, :body
  
  def initialize(params)
    puts "I am in class Post < Sequel::Model"  
    @title =     params[:title]
    @body =      params[:body]
  end
  
  def saved()
    puts "Post save"
    Post.insert({:title=> self.title, :body=>self.body,
       :create => Time.now, :update => Time.now})
  end
  
  def validate
        super 
    validates_type String, [:title, :body]
    validates_presence [:title, :body]
  end
  
end