module Db_html_hash
  @html_to_database = {
    "data_Person_Residence_Country" => {"value" => :tax_jurisdiction_id, "name" => :country_name, "function" => "all_countries"},
    "data_Person_Filing_Status" => {"value" => :filing_status_id, "name" => :filing_status_name, "function" => "all_filing_statuses"},
    "econ_transaction_name" => {"value" => :econ_transaction_id, "name" => :econ_transaction_name, "function" => "all_econ_transactions_individual"},
    "data_Income_Location_Country" => {"value" => :tax_jurisdiction_id,"name" => :country_name, "function" => "all_countries"},
    "data_Income_Source" => {"value" =>:econ_transaction_id, "name" =>:econ_transaction_name, "function" => "all_econ_transactions_individual" }
  }
  

  def self.html_to_database()
    return @html_to_database
  end
end