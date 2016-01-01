require '.../../../lib/creating_personal_object/personal_object' #This for creating the class where the personal object will reside
require '.../../../lib/creating_economic_object_numbers/economic_object_numbers' #Economic_Aggregate_numbers
require '.../../../lib/creating_economic_object/economic_object' #Single_Economic_Objects
require '.../../../lib/creating_economic_object_aggregate/economic_object_aggregate'#Aggregate economic object
module HomeHelperTaxCalculation
  def self.calculate_taxes(params)
    @personal_economic_data_object = {
      :personal_object => Personal_object.new(params),
      :economic_object_numbers => Economic_object_numbers.new(params),
    }
    @economic_data_object = {};

    call_each_economic_object(params)
    @personal_economic_data_object[:economic_object_aggregate] = Economic_object_aggregate.new(@economic_data_object)
  end
  
  def self.call_each_economic_object(params)
    puts "HomeHelperTaxCalculation -> self.call_each_economic_object"
    puts "This is the params: #{params}"
    
    @personal_economic_data_object[:economic_object_numbers].number_of_income.times do |numbers_in_loop|
      
      numbers_assigned_to_income =  @personal_economic_data_object[:economic_object_numbers].numbers_assigned_to_income[numbers_in_loop]
      
      @economic_data_object["economic_data_Object_Created_"+numbers_assigned_to_income.to_s] = Economic_object.new(params,numbers_assigned_to_income)
    end  

  end
end