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
    render :plain => "test_data_filler", :status => 200
  end
  
end
