module Convert_to_html
  
  #This is for the options module to load up the choices from the DB
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
  
  #This is to represent the tax information in the website
  def self.convert_to_html_text_tax_calculations()
    @number_of_incomes = HomeHelperTaxCalculation.number_of_incomes();
    @economic_data_object = HomeHelperTaxCalculation.economic_data_object();
    @personal_economic_data_object = HomeHelperTaxCalculation.personal_economic_data_object();
    @header_income = html_header_creation() 
    @seperate_income = "";
    @seperate_income = html_seperate_income_creation()
    puts @header_income.class
    puts @seperate_income.class
    @full_html = @header_income + @seperate_income
    return @full_html
  end
  
  private
  
  def self.html_header_creation()
    puts "This is the html_header_creation: (econmic_object_aggregate): #{@personal_economic_data_object[:economic_object_aggregate]}"
    total_income = @personal_economic_data_object[:economic_object_aggregate].data_Income_Size_aggregate
    total_taxes = @personal_economic_data_object[:economic_object_aggregate].data_Total_Tax
    header = "<div>Total income:#{total_income}</div> 
    <div>Total taxes:#{total_taxes}</div>
    <div>Number of different incomes:#{@number_of_incomes}</div><br>"
  end
  
  def self.html_seperate_income_creation()
    @economic_data_object.each{|key,value|
      puts "This is the key:#{key}"
      puts "This is the value:#{value.inspect}"
      seperate_run = seperate_runs(key,value)
      @seperate_income = @seperate_income + seperate_run
    }
    return @seperate_income
  end
  
  def self.seperate_runs(name,values)
    income_number = values.numbers_assigned_to_income
    name_data_Income_Source = values.name_data_Income_Source;
    tax_applied = values.tax_type_name;
    size_of_the_income = values.data_Income_Size;
    amount_taxed = values.income_stop - values.income_start;
    taxes_to_pay = values.data_Income_Tax;
    start_of_the_taxation = values.income_start;
    end_of_the_taxation = values.income_stop;
    #puts "These are the taxes to pay: #{taxes_to_pay}"
      @income_instance = "<div>#{income_number} income:</div>
<div>Income Source:#{name_data_Income_Source}</div>
<div>Tax applied:#{tax_applied}</div>
<div>Size of the income:#{size_of_the_income}</div>
<div>Amount Taxed:#{amount_taxed}</div>
<div>Taxes to Pay:#{taxes_to_pay}</div>
<div>Start of the taxation:#{start_of_the_taxation}</div>
<div>End of the taxation:#{end_of_the_taxation}</div><br>"
      return @income_instance
  end
  
end
