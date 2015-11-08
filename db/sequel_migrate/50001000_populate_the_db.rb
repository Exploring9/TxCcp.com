Sequel.migration do
  up do
    TxCcp_Seeds::data_40001000_tax_jurisdiction()
    TxCcp_Seeds::data_40001010_description()
    TxCcp_Seeds::data_40001100_country()
    TxCcp_Seeds::data_40001200_state()
    TxCcp_Seeds::data_40001300_filing_status()
    TxCcp_Seeds::data_40001400_tax_jurisdiction_and_filing_status()
    TxCcp_Seeds::data_40001500_econ_transaction_group()
    TxCcp_Seeds::data_40001510_econ_transaction()
    TxCcp_Seeds::data_40001520_tax_jurisdiction_and_econ_transaction()
    TxCcp_Seeds::data_40001600_tax_type()
    TxCcp_Seeds::data_40001700_taxation()
    TxCcp_Seeds::data_40001800_currency()
    TxCcp_Seeds::data_40001900_financial_year()
    TxCcp_Seeds::data_40002000_tax_rate()
    TxCcp_Seeds::data_40002100_tax_levy()
    TxCcp_Seeds::data_40002200_tax_bracket()
    TxCcp_Seeds::data_40002300_tax_rate_has_bracket()
  end
  
  down do
    
  end
end