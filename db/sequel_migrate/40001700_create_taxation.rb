Sequel.migration do
  up do
    create_table(:taxation) do
      primary_key :tax_id
      foreign_key :tax_jurisdiction_id, :tax_jurisdiction,  :null=>false
      foreign_key :filing_status_id,    :filing_status,     :null=>false
      foreign_key :tax_type_id,         :tax_type,          :null=>false
      index [:tax_jurisdiction_id, :filing_status_id, :tax_type_id, :tax_id],    :unique => true
    end
    
  end
  
  down do
    drop_table(:taxation)
  end
end