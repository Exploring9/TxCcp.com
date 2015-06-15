#require './config/database_sequel.rb'
class FeedbackController < ApplicationController
  
  def feedback
  end
  
  def index
    puts Database_Sequel::DB
  end
end
