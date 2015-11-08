Sequel.migration do
  up do
    create_table(:tax_jurisdiction) do
      primary_key :tax_jurisdiction_id
    end
    #TxCcp_Seeds::data_40001000_tax_jurisdiction()
  end
  
  down do
    drop_table(:tax_jurisdiction)
  end
end
