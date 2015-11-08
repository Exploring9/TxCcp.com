Sequel.migration do
  up do
    create_table(:tax_jurisdiction_and_filing_status) do
      foreign_key :filing_status_id,    :filing_status,   :null=>false
      foreign_key :tax_jurisdiction_id, :tax_jurisdiction,:null=>false
      foreign_key :description_id, :description,    :null=>false
      index [:filing_status_id, :tax_jurisdiction_id],    :unique => true
    end
   # TxCcp_Seeds::data_40001400_tax_jurisdiction_and_filing_status()
  end
  
  down do
    drop_table(:tax_jurisdiction_and_filing_status)
  end
end