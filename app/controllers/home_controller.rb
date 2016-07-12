require '.../../../lib/prepare_tax_info/prepare_tax_info' 
#Prepare the information to be shared on the website (it will be become responsive and two ways communications)
class HomeController < ApplicationController
  include Database_Sequel 
  def index
  end
  
  def send_Input_Data
    @data = HomeHelper::set_up_data_fetch(params)
    puts "HomeController.Send_Input_Data"
    puts @data.inspect
    render :plain => @data, :status => 200
  end
  
  def send_All_Info
    puts params
    puts HomeHelperTaxCalculation::calculate_taxes(params)
    puts "This is after the HomeHelperTaxCaclulation has been called"
    @info_for_the_website = Prepare_tax_info.new()
    puts "This is the @info_for_the_website: #{@info_for_the_website.full_html}"
    render :plain => @info_for_the_website.full_html, :status => 200
  end
  
  def data_test
    puts inspect
    
  end
  
  def data
    render :json => [1,3,3,3,5]
  end
  
end
