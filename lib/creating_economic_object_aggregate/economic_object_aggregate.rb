class Economic_object_aggregate
  attr_reader :data_Income_Size_aggregate
  
  def initialize(economic_data_object)
    @data_Income_Size_aggregate = addition(economic_data_object)
  end
  
  def addition(economic_data_object)
    
    income_aggregate = 0
      economic_data_object.each do |key, value| 
        
        income_aggregate = income_aggregate + value.data_Income_Size.to_i
        
      end
      
      return income_aggregate
      
  end
end