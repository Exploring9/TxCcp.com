Sequel.migration do
  up do
    create_table(:country) do
      primary_key :country_id
      String :country_name,   :size=>100,                            :null=>false
      String :country_abbreviation,     :size=>3,                  :null=>false
      foreign_key :tax_jurisdiction_id, :tax_jurisdiction,:null=>false
      index [:country_id, :tax_jurisdiction_id], :unique => true
    end
    #TxCcp_Seeds::data_40001100_country()
  end
  
  down do
    drop_table(:country)
  end
end