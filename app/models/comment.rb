Sequel::Model.plugin(:validation_helpers)
class Comment < Sequel::Model
  plugin :validation_helpers
  attr_accessor :name, :body, :post_id
  many_to_one :post
  
  attr_accessor :name, :body, :post_id
  
  def initialize(params)
    puts "I am in class Comment < Sequel::Model"  
    @name =      params[:name]
    @body =      params[:body]
    @post_id =   params[:post_id]
  end
  
  def saved()
    puts "Comment save"
    Comment.insert({:name=> self.name, :body=>self.body, :post_id => self.post_id,
       :create => Time.now, :update => Time.now})
  end
  
  def validate
        super 
   # validates_type String, [:name, :body]
   # validates_type Interger, [:post_id]
   # validates_presence [:name, :body, :post_id]
  end
  
end
