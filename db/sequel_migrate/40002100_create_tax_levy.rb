Sequel.migration do
  up do
    create_table(:tax_levy) do
      primary_key :tax_levy_id
      foreign_key :tax_rate_id, :tax_rate, :null=>false
      foreign_key :tax_id, :taxation, :null=>false
    end
    
  end
  
  down do
    drop_table(:tax_levy)
  end
end