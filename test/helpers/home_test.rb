require '.../../../app/helpers/home_helper'
class HomeHelperTest < ActionView::TestCase
  #Do the same tests for the other methods/values
  def test_set_up_data_fetch_country
    #Pass a stub method to it and see whether it bring back the correct value
     result = HomeHelper.set_up_data_fetch({"value"=>:tax_jurisdiction_id, "name"=>:country_name, "function"=>"fetch_country"})
     assert(result, "data_Person_Residence_Country,<option value=52>United States of America</option>")
  end
  
  def test_set_up_data_fetch_filing_status
    result = HomeHelper.set_up_data_fetch({"name"=>["data_Person_Filing_Status"], "from_selection"=>["data_Person_Residence_Country"], "value"=>["52"]})
    assert(result,"data_Person_Filing_Status,<option value=1>Single</option>,<option value=2>Married filing separately</option>,<option value=3>Head of household</option>,<option value=4>Married filing jointly</option>,<option value=5>Qualifying widow(er) with dependent child</option>")
  end
  
  def test_set_up_data_source_of_income
    result = HomeHelper.set_up_data_fetch({"name"=>["data_Income_Source"], "from_selection"=>["data_Income_Location_Country"], "value"=>["52"]})
    assert(result,"data_Income_Source,<option value=1>Wages and Salaries</option>,<option value=2>Interest Received</option>,<option value=3>Dividends</option>,<option value=4>Business Income</option>,<option value=5>Capital Gains and Losses</option>")
  end
end