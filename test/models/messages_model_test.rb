require 'test_helper'
#I am using minitest so I start my tests with def
#I am using valid? instead of just .new because in my model I need to validate first 
#There is no automatic validations when it gets created
#Sequel::Model.db.transaction(:rollback=>:always)
class MessagesModelTest < ActiveSupport::TestCase
  
  def test_no_message_without_required_stuff
      assert_not Message.new(:name => "",:email => "@", :content => "a").valid?,
      "A message without a name shouldn't be validated"
      assert_not Message.new(:name => "a",:email => "", :content => "a").valid?,
      "A message without an email shouldn't be validated"     
      assert_not Message.new(:name => "a",:email => "@", :content => "").valid?,
      "A message without content shouldn't be validated"  
      assert Message.new(:name => "a",:email => "@", :content => "s").valid?
      
  end
  
  
end