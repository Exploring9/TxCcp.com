Sequel.migration do
  up do
    create_table(:tax_rate) do
      primary_key :tax_rate_id
      foreign_key :financial_year_id, :financial_year, :null=>false
      foreign_key :currency_id, :currency, :null=>false
    end
  end
  
  down do
    drop_table(:tax_rate)
  end
end