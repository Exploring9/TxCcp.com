#symbolize_keys is used to convert the strings into symbols
#http://yaml.org/YAML_for_ruby.html#symbols
require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  
  def test_messages
    @test1 = YAML::load(File.open('test/fixtures/messages.yml'))
    assert(Message.new(@test1["good_message"]).valid?, "Message should be valid")
  end
  
  def test_send_message
    # Send the email, then test that it got queued
    @test1 = YAML::load(File.open('test/fixtures/messages.yml'))
    testing_email = Message.new(@test1["good_message"])
    assert_emails 1 do
      @email1 = MessageMailer.new_message(testing_email).deliver_now
    end
 
    # Test the body of the sent email contains what we expect it to
    assert_equal ['raikutis@gmail.com'], @email1.from
    assert_equal ['raikutis@gmail.com'], @email1.to
    assert_includes @email1.body, 'test_content'
    assert_includes @email1.body, 'test_name'
  end
   
end
