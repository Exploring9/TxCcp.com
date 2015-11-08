Sequel.migration do
  up do
    create_table(:econ_transaction) do
      primary_key :econ_transaction_id
      String      :econ_transaction_name,    :size=>100, :null=>false
      foreign_key :econ_transaction_group_id, :econ_transaction_group, :null=>false
      # The join table tax_jurisdiction_and_econ_transaction
      # It will allow me to control which econ_transaction can be assigned to what countries
    end
    
  end
  
  down do
    drop_table(:econ_transaction)
  end
end