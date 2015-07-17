Sequel::Model.plugin(:validation_helpers)
class Post < Sequel::Model
  one_to_many :comments
  plugin :validation_helpers
  plugin :association_dependencies, :comments => :delete
  
  attr_accessor :title, :body, :post_type

  
  def initialize(params)
    puts "I am in class Post < Sequel::Model"  
    @title =           params[:title]
    @body =            params[:body]
    @post_type =       params[:post_type]
  end
  
  def saved()
    puts "Post save"
    Post.insert({:title=> self.title, :body=>self.body, :post_type => self.post_type,
       :create => Time.now, :update => Time.now})
  end
  
  def validate
        super 
    validates_type String, [:title, :body, :post_type]
    validates_presence [:title, :body, :post_type]
  end
  
end