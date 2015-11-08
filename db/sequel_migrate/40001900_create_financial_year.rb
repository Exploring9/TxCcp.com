Sequel.migration do
  up do
    create_table(:financial_year) do
      primary_key :financial_year_id
      Date  :start_of_financial_year, :null => false
      Date  :end_of_financial_year,   :null => false
      String :financial_year_name,  :size=>100,  :null => false
      Date  :payment_date,            :null => false
      foreign_key :tax_jurisdiction_id, :tax_jurisdiction, :null=>false      
    end
    
  end
  
  down do
    drop_table(:financial_year)
  end
end

#Implement a check that checks whether the end of financial year is after the start of the financial year