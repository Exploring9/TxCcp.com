require '.../../../lib/personal_object/personal_object' #This for creating the class where the personal object will reside
require '.../../../lib/economic_object_numbers/economic_object_numbers' #Economic_Aggregate_numbers
require '.../../../lib/economic_object/economic_object' #Single_Economic_Objects
require '.../../../lib/economic_object_aggregate/economic_object_aggregate'#Aggregate economic object

module HomeHelperTaxCalculation
  #Create the personal and economic data objects (They will hold the value entered in the website)
  def self.calculate_taxes(params)
    #Personal and general parameters
    @personal_economic_data_object = {
      :personal_object => Personal_object.new(params),
      :economic_object_numbers => Economic_object_numbers.new(params)
    }
    #Each income's data
    @economic_data_object = {};
    @number_of_incomes = @personal_economic_data_object[:economic_object_numbers].number_of_income;
    call_each_economic_object(params)
    #Addition of a short aggregate income info
    @personal_economic_data_object[:economic_object_aggregate] = Economic_object_aggregate.new(@economic_data_object)
    get_the_taxes(@personal_economic_data_object);
    @personal_economic_data_object[:economic_object_aggregate].tax_addition(@economic_data_object) #This is to get the total tax
  end
  
  def self.personal_economic_data_object
    return @personal_economic_data_object
  end
  
  #Call the economic data object on each income type
  def self.call_each_economic_object(params)
    puts "HomeHelperTaxCalculation -> self.call_each_economic_object"
    puts "This is the params: #{params}"
    
    @number_of_incomes.times do |numbers_in_loop|
      numbers_assigned_to_income = @personal_economic_data_object[:economic_object_numbers].numbers_assigned_to_income[numbers_in_loop]
      @economic_data_object["economic_data_Object_Created_"+numbers_assigned_to_income.to_s] = Economic_object.new(params,numbers_assigned_to_income)
    end  
  end
  
  def self.get_the_taxes(personal_economic_data_object)
    puts @economic_data_object
    @economic_data_object.each{|key,value|
      puts "This is the key:#{key}"
      puts "This is the value:#{value}" 
      puts value.calculation_of_taxes(personal_economic_data_object)
    }
    
    @economic_data_object.each{|key,value|
      puts "This is the key:#{key}"
      puts "This is the value_economic_object:#{value}"
      puts value.inspect
    }
    
    puts @personal_economic_data_object[:economic_object_aggregate].inspect
    #Also calculate the range in which the tax needs to be calculated (From 0 to 10, then from 10 to 20 and so on)
  end
  
  #For access of the variables:
  def self.number_of_incomes()
    return @number_of_incomes
  end
  
  def self.personal_economic_data_object()
    return @personal_economic_data_object
  end
  
  def self.economic_data_object()
    return @economic_data_object
  end
end