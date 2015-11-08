Sequel.migration do
  up do
    create_table(:currency) do
      primary_key :currency_id
      foreign_key :tax_jurisdiction_id, :tax_jurisdiction, :null=>false
      String      :currency_name,  :size=>100,     :null => false
      String      :ISO4217code,    :size=>10,      :null => false
      index [:currency_id, :tax_jurisdiction_id],    :unique => true
    end
    
  end
  
  down do
    drop_table(:currency)
  end
end