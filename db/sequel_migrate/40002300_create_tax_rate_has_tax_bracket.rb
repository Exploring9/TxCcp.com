Sequel.migration do
  up do
    create_table(:tax_rate_has_tax_bracket) do   
      primary_key :tax_linkage_id
      Integer :tax_bracket_number,   :null=>false  
      Integer :total_brackets,       :null=>false 
      foreign_key :tax_rate_id, :tax_rate, :null=>false
      foreign_key :tax_bracket_id, :tax_bracket, :null=>false
      index [:tax_bracket_number,:tax_rate_id], :unique => true
    end
  end
  
  down do
    drop_table(:tax_rate_has_tax_bracket)
  end
end