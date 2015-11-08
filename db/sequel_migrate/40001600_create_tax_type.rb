Sequel.migration do
  up do
    create_table(:tax_type) do
      primary_key :tax_type_id
      String      :tax_type_name, :size=>100,                   :null=>false
      foreign_key :econ_transaction_id, :econ_transaction,      :null=>false
      index [:tax_type_id, :econ_transaction_id],               :unique => true
    end
    
  end
  
  down do
    drop_table(:tax_type)
  end
end