require '.../../../lib/db_html_hash/db_html_hash'
module HomeHelper
  
  def self.set_up_data_fetch(params)
    puts params
    @params = params;@results="";
    puts "This is params['name']: #{@params['name'][0]}";
    puts @params["value"]
    @html_to_database = Db_html_hash::html_to_database()

    @html_to_database.each do |type_of_characteristic, values|
      puts type_of_characteristic;puts values

      if type_of_characteristic == @params["name"][0] #This is to get the html name value
        puts "Equals type: #{type_of_characteristic}"
        puts "These are the values: #{values}"
        
        tax_jurisdiction_id = @params["value"]||''#Or make it equal to tax_jurisdiction_id
        
        @db_query_results = HomeHelper.send(values["function"],tax_jurisdiction_id)
        puts @db_query_results
        @results = HomeHelper::convert_to_html(@db_query_results,@params["name"][0])#This is to know what data to fetch 
      end
    end
    puts "This is #{@results}";
    return @results #Make sure that there are no useless loops
  end
  
  # Put it in a seperate module
  def self.convert_to_html(db_results, type_of_data)
    puts "This is convert_to_html: #{db_results}";
    puts "This is type_of_data: #{type_of_data}";
    puts @html_to_database
    generated_html = type_of_data;#This is to know to which HTML to add the info [I make into a string so that Javascript can easily make into an array]

    @db_access_value = @html_to_database[type_of_data]["value"];
    @db_access_name = @html_to_database[type_of_data]["name"];

    db_results.each do |db_result|
      value = db_result[@db_access_value]
      name = db_result[@db_access_name]
      generated_html.concat(",").concat("<option value=#{value}>#{name}</option>");
    end
    puts generated_html;
    return generated_html;
  end
  
  
  #Put it in a seperate module
  def self.fetch_country(*args)
   args.empty? ? (raise "Received these arguments: #{args}") : ""
   @all_countries = View_all_taxes.all_countries()
  end
  
  def self.fetch_filing_status(tax_jurisdiction_id)
   @filling_status_per_jurisdiction = View_all_taxes.all_filing_statuses(tax_jurisdiction_id)
  end
  
  def self.fetch_econ_transaction(tax_jurisdiction_id)
    @econ_transaction_per_jurisdiction = View_all_taxes.all_transaction_per_countr
  end
end
