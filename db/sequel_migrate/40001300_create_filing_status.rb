Sequel.migration do
  up do
    create_table(:filing_status) do
      primary_key :filing_status_id
      String :filing_status_name,     :size=>100,        :null=>false
    end
    #TxCcp_Seeds::data_40001300_filing_status()
  end
  
  down do
    drop_table(:filing_status)
  end
end