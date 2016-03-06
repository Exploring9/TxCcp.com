class Economic_object_aggregate
  attr_reader :data_Income_Size_aggregate,:data_Income_Intervals
attr_accessor :data_Total_Tax
  def initialize(economic_data_object)
    @data_Income_Intervals = {}
    @data_Income_Size_aggregate = addition(economic_data_object)
    @data_Total_Tax = 0;
  end
  
  def addition(economic_data_object)
    income_aggregate = 0
      economic_data_object.each do |key, value| 
        puts "Economic_object_aggregate"
        puts key
        puts value
        number_assigned_to_income_symbol = value.numbers_assigned_to_income.to_i
        income_aggregate = income_aggregate + value.data_Income_Size.to_i
        @data_Income_Intervals[number_assigned_to_income_symbol] = income_aggregate - value.data_Income_Size.to_i
      end
      puts "This is @data_Income_Intervals:#{@data_Income_Intervals}"
      return income_aggregate   
  end
  
  def tax_addition(economic_data_object)
    @data_Total_Tax = 0
      economic_data_object.each do |key, value| 
        puts "Economic_object_aggregate-Tax_Addition"
        puts key
        puts value.inspect
        @data_Total_Tax = @data_Total_Tax + value.data_Income_Tax
      end
      puts "This is the total tax:#{@data_Total_Tax}"
      return @data_Total_Tax       
  end
end