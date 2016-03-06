class Economic_object_numbers
  attr_reader :number_of_income,:numbers_assigned_to_income
  def initialize(params)
    @number_of_income = count_number_of_incomes(params,"number_of_income");
    @numbers_assigned_to_income = count_number_of_incomes(params,"numbers_assigned_to_income");
  end

  def count_number_of_incomes(params, to_return)
    number_of_income = 0
    numbers_assigned_to_income = []
    
    params.each do |part,value|
      if part[0..28] == "economic_data_Object_Created_"
      number_of_income = number_of_income + 1
      numbers_assigned_to_income.push(part[29..-1]);
      end
    end

    if to_return == "number_of_income"
      return number_of_income
    elsif to_return == "numbers_assigned_to_income"
      return numbers_assigned_to_income
    else
      raise "Economic_object_numbers -> count_number_of_incomes -> Weird argument -> ERROR"
    end
  end

end