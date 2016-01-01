class Economic_object
  attr_reader :numbers_assigned_to_income, 
  :data_Income_Location_Country, 
  :data_Income_Source, 
  :data_Income_Size
  def initialize(params, numbers_assigned_to_income)
    @numbers_assigned_to_income = numbers_assigned_to_income
    @data_Income_Location_Country = normalize_data_Income_Location_Country(params)
    @data_Income_Source = normalize_data_Income_Source(params)
    @data_Income_Size = normalize_data_Income_Size(params)
  end
  
  def normalize_data_Income_Location_Country(params)
    return params["economic_data_Object_Created_"+@numbers_assigned_to_income]["data_Income_Location_Country"]
  end  
  
  def normalize_data_Income_Source(params)
    return params["economic_data_Object_Created_"+@numbers_assigned_to_income]["data_Income_Source"]
  end
  
  def normalize_data_Income_Size(params)
    return params["economic_data_Object_Created_"+@numbers_assigned_to_income]["data_Income_Size"]
  end
end