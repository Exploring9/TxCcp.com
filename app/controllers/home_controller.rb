class HomeController < ApplicationController
  include Database_Sequel 
  def index
    @info = View_all_taxes.all_entries()
    #puts @info
    #puts @info.class
    #puts @test_countries.class
    @test_filing_status = View_all_taxes.all_filing_statuses(52)
    puts "This is filing status for tax_jurisdiction_id:52 #{@test_filing_status}"
    @test_econ_transaction_name = View_all_taxes.all_econ_transactions(52)
    puts "This is econ_transaction_name for tax_jurisdiction_id:52 #{@test_econ_transaction_name}"
=begin
   all_entries = DB[:all_taxes].where(:tax_jurisdiction_id=>52, :tax_id => 6).all
   puts all_entries
   
   puts Tax_jurisdiction::all_tax_jurisdiction()
=begin   
   puts Tax_jurisdiction.methods(false)
   puts Tax_jurisdiction.instance_methods
   puts "No inherited methods"
   puts Tax_jurisdiction.instance_methods - Object.methods
=end
  end
  
  def Send_Input_Data
    @data = HomeHelper::set_up_data_fetch(params)
    puts "HomeController.Send_Input_Data"
    puts @data.inspect
    render :plain => @data, :status => 200
  end
  

end
