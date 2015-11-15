class HomeController < ApplicationController
  include Database_Sequel
  def index
    info = View_all_taxes.all_entries()
    puts info
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
  

end
