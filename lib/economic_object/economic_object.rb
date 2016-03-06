#require view_all_taxes_helper
# use it to access the DB
class Economic_object
  attr_reader :numbers_assigned_to_income, 
  :data_Income_Location_Country, 
  :data_Income_Source, :name_data_Income_Source,
  :data_Income_Size,
  :taxed_income,
  :income_start,
  :income_stop,
  :tax_type_name, :data_Income_Tax
  
  def initialize(params, numbers_assigned_to_income)
    @numbers_assigned_to_income = numbers_assigned_to_income.to_i
    @data_Income_Location_Country = normalize_data_Income_Location_Country(params)
    @data_Income_Source = normalize_data_Income_Source(params)
    @name_data_Income_Source = normalize_name_data_Income_Source(params)
    @data_Income_Size = normalize_data_Income_Size(params)
    @data_Income_Tax = 0;
    @data_Income_Tax_Rates = {}
  end
  
  def second_initialization()
    puts "The total income:";
    @economic_object_aggregate = HomeHelperTaxCalculation::personal_economic_data_object()[:economic_object_aggregate]
    
    puts @economic_object_aggregate.inspect
    @income_start = @economic_object_aggregate.data_Income_Intervals[@numbers_assigned_to_income]
    @income_stop = @income_start + @data_Income_Size
    puts "This is the @interval_start: #{@income_start.inspect} This is the interval_stop: #{@income_stop.inspect}"

  end
  
  def normalize_data_Income_Location_Country(params)
    return params["economic_data_Object_Created_"+@numbers_assigned_to_income.to_s]["data_Income_Location_Country"]
  end  
  
  def normalize_data_Income_Source(params)
    return params["economic_data_Object_Created_"+@numbers_assigned_to_income.to_s]["data_Income_Source"]
  end
  
  def normalize_name_data_Income_Source(params)
    return params["economic_data_Object_Created_"+@numbers_assigned_to_income.to_s]["name_data_Income_Source"]
  end
  
  def normalize_data_Income_Size(params)
    return params["economic_data_Object_Created_"+@numbers_assigned_to_income.to_s]["data_Income_Size"].to_f
  end
 
  def calculation_of_taxes(personal_economic_data_object)
    add_tax_objects(personal_economic_data_object)
    second_initialization()
    calculate_the_tax()
  end
  
  def add_tax_objects(personal_economic_data_object)
    #@import_all_tax_information = View_all_taxesHelper.all_entries();
    @tax_type_id = View_all_taxesHelper.all_tax_type_per_econ_transactions_and_tax_jurisdiction_id(@data_Income_Location_Country,@data_Income_Source)
    @tax_type_name = @tax_type_id[0][:tax_type_name]
    @tax_type_id = @tax_type_id[0][:tax_type_id];#This is to get the result -> There is an uniqueness constraint between tax_type_id and econ_transactions
    
    puts "This is the result: @test_tax_type #{@tax_type_id}"
    @filing_status_id= personal_economic_data_object[:personal_object].data_Person_Filing_Status
    
    @tax_id =View_all_taxesHelper.all_tax_id_from_taxation(@data_Income_Location_Country,@tax_type_id,@filing_status_id)
    @tax_id = @tax_id[0][:tax_id] #There can only be one result due to the uniqueness constraint
    
    puts "This is the result: @tax_id -> #{@tax_id}"
    
    @group_tax_rate_id = View_all_taxesHelper.all_tax_rate_id_from_financial_year_and_currency(1,1)#Hardcoded financial year and currency
    
    @tax_rate_id = View_all_taxesHelper.all_tax_rate_from_tax_id(@tax_id)
    @tax_rate_id = @tax_rate_id[0][:tax_rate_id]#There can only be one result due to the uniqueness constraint
    
    @tax_bracket_information = View_all_taxesHelper.all_information_from_tax_levy_id(@tax_rate_id)
    puts @tax_bracket_information
  end
  
  private
  
  def tax_bracket_hash_creation(loop_number)
    sub_hash_tax_rates=Hash[]
    sub_hash_tax_rates["taxed_income"] = @taxed_income
    sub_hash_tax_rates["tax_rate"] = @tax_bracket_information[loop_number][:tax_percentage]
    sub_hash_tax_rates["taxes_to_pay"] = sub_hash_tax_rates["taxed_income"] * sub_hash_tax_rates["tax_rate"]/100
    @data_Income_Tax = @data_Income_Tax +  sub_hash_tax_rates["taxes_to_pay"]
    return sub_hash_tax_rates;
  end
  
  def tax_bracket_calculation()
    @tax_rate_loop = 0
    puts "This is the @tax_bracket_information: #{@tax_bracket_information[@tax_rate_loop]} "
    #puts @tax_bracket_information[@tax_rate_loop][:tax_ceiling];puts @income_stop
   
    until (@tax_bracket_information[@tax_rate_loop][:tax_ceiling]) > @income_stop do
      @tax_rate_loop += 1;
      puts "This is the @tax_rate_loop: #{@tax_rate_loop}"
    end
    
    @tax_rate_loop_iterate = @tax_rate_loop + 1; #Since the counting starts at zero in a hash
    puts "Tax rate loopiterate: #{@tax_rate_loop_iterate}"
    @tax_rate_loop_iterate.times do |i|
      @tax_floor = @tax_bracket_information[i][:tax_floor] 
      @tax_ceiling = @tax_bracket_information[i][:tax_ceiling]
      puts "This is the i operator: #{i} This is the @tax_floor: #{@tax_floor} and the @tax_ceiling: #{@tax_ceiling}"
      puts "This is the @income_start: #{@income_start} and this @income_stop: #{@income_stop} and the difference is: #{@income_stop-@income_start}"
      if @income_start > @tax_ceiling
        #no taxation since the income is above the tax_ceiling and goes to the next rate
      elsif @income_stop < @tax_floor
        #no taxation since the income is below the tax_floor and skips this rate
      elsif @income_start < @tax_ceiling && @income_stop < @tax_ceiling 
        @taxed_income = @income_stop - @tax_floor
        @data_Income_Tax_Rates[i] = tax_bracket_hash_creation(i)
      elsif @income_start < @tax_ceiling && @income_stop > @tax_ceiling
        @taxed_income = @tax_ceiling - @income_start
        @data_Income_Tax_Rates[i] = tax_bracket_hash_creation(i)
      else
        raise "Error - Impossible" 
      end 
      i += 1;
    end
  end
  
  def calculate_the_tax()
    puts "This is the number assigned to the income:{#@numbers_assigned_to_income}"
    puts "The size of the income:{#@data_Income_Size}"
    
    tax_bracket_calculation()
    
    puts "This is the Tax Rate:{#@data_Income_Tax_Rates}"
   
  end
end

    #From tax_type table
    #From taxation table
    #Link tax_type_id//filing_status_id//tax_jurisdiction_id
    #//-> Get tax_id
    
    #Get tax_rate_id and tax_levy_id from tax_levy table -> Be careful this table will needed stricter rules
    #But how can they be implemented?
    #// Above is the hard part - (Somehow - I will need to force it through
    #Get the tax_rate_id from the financial year and find the only one there)
    #tax_rate (table) -> force currency_id and financial_year_id
    
    #The rest if the actual tax calculation (OK)