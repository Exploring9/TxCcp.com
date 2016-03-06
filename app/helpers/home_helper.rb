require '.../../../lib/db_html_hash/db_html_hash' #This is to know for what html element which function needs to be invoked
require '.../../../models/models_helper/view_all_taxes_helper' #This is to invoke the functions to fetch the data from the database (The function that where invoked in the db_html_hash)
require '.../../../lib/convert_to_html/convert_to_html' #This is to convert the DB results into html data so that you can add options
module HomeHelper
  
  def self.set_up_data_fetch(params)
    puts params
    @params = params;
    @results="";
    puts "This is params['name']: #{@params['name'][0]}";
    puts @params["value"]
    @html_to_database = Db_html_hash::html_to_database()

    @html_to_database.each do |type_of_characteristic, values|
      puts type_of_characteristic;puts values

      if type_of_characteristic == @params["name"][0] #This is to get the html name value
        puts "Equals type: #{type_of_characteristic}"
        puts "These are the values: #{values}"
        
        needed_id = @params["value"]||''#Or make it equal to tax_jurisdiction_id
        
        @db_query_results = View_all_taxesHelper.send(values["function"],needed_id)
        puts @db_query_results
        @results = Convert_to_html::convert_to_html_select_options(@html_to_database,@db_query_results,@params["name"][0])#This is to know what data to fetch 
      end
    end
    puts "This is #{@results}";
    return @results #Make sure that there are no useless loops
  end  
end
