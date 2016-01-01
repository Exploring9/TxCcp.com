module Db_fetcher
  def self.fetch_country(*args)
   args.empty? ? (raise "Received these arguments: #{args}") : ""
   @all_countries = View_all_taxes.all_countries()
  end
  
  def self.fetch_filing_status(tax_jurisdiction_id)
   @filling_status_per_jurisdiction = View_all_taxes.all_filing_statuses(tax_jurisdiction_id)
  end
  
  def self.fetch_econ_transaction_individual(tax_jurisdiction_id)
    @econ_transaction_per_jurisdiction = View_all_taxes.all_econ_transactions_individual(tax_jurisdiction_id)
  end
end