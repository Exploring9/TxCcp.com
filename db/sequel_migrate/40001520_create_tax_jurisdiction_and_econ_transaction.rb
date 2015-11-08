Sequel.migration do
  up do
    create_table(:tax_jurisdiction_and_econ_transaction) do
      foreign_key :econ_transaction_id, :econ_transaction,   :null=>false
      foreign_key :tax_jurisdiction_id, :tax_jurisdiction,   :null=> false
      foreign_key :description_id, :description,             :null=>false
      index [:tax_jurisdiction_id, :econ_transaction_id], :unique => true
    end
  end
  
  down do
    drop_table(:tax_jurisdiction_and_econ_transaction)
  end
end