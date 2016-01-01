module Convert_to_html
  
  def self.convert_to_html_select_options(html_to_database,db_results, type_of_data)
    puts "This is convert_to_html: #{db_results}";
    puts "This is type_of_data: #{type_of_data}";
    puts html_to_database
    generated_html = type_of_data;#This is to know to which HTML to add the info [I make into a string so that Javascript can easily make into an array]

    @db_access_value = html_to_database[type_of_data]["value"];
    @db_access_name = html_to_database[type_of_data]["name"];
    db_results.each do |db_result|
      value = db_result[@db_access_value]
      name = db_result[@db_access_name]
      generated_html.concat(",").concat("<option value=#{value}>#{name}</option>");
    end
    puts generated_html;
    return generated_html;
  end
  
end
