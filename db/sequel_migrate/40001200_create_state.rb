Sequel.migration do
  up do
    create_table(:region) do
      primary_key :region_id
      String :region_name,   :size=>100,                              :null=>false
      String :region_abbreviation,     :size=>3,                             :null=>false
      foreign_key :country_id,                    :country,         :null=>false
      foreign_key :tax_jurisdiction_id,           :tax_jurisdiction,:null=>false
      index [:tax_jurisdiction_id,:region_id],    :unique => true
      index [:tax_jurisdiction_id,:country_id],  :unique => true
    end
    #TxCcp_Seeds::data_40001200_state()
  end
  
  down do
    drop_table(:region)
  end
end