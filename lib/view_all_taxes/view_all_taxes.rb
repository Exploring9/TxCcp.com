module View_all_taxes
  include Database_Sequel
  
  def self.all_entries()
    all_entries = DB[:view_all_taxes].all
  end
  
  #All_countries are done
  def self.all_countries(*args)
    args.empty? ? (raise "Received these arguments in View_all_taxesHelper - > all_entries: #{args}") : ""
    all_countries = DB[:view_all_taxes].select(:country_name, :tax_jurisdiction_id).distinct(:tax_jurisdiction_id).exclude(:country_abbreviation=>nil).all
    return all_countries
  end
  
  #All_filig_statuses per tax_jurisdiction_id
  def self.all_filing_statuses(tax_jurisdiction_id)
    results = DB[:view_all_taxes].select(:filing_status_id,:filing_status_name).distinct(:filing_status_id).exclude(:filing_status_id=>nil).where(:tax_jurisdiction_id=>tax_jurisdiction_id).all
  end
  
  #All_econ_transactions per tax_jurisdiction_id
  def self.all_econ_transactions_individual(tax_jurisdiction_id)
    results = DB[:view_all_taxes].select(:econ_transaction_id, :econ_transaction_name).distinct(:econ_transaction_id).exclude(:econ_transaction_id=>nil).where(:tax_jurisdiction_id=>tax_jurisdiction_id).all
  end
  
  #All tax types for a type of econ_transaction and tax_jurisdiction_id
  def self.all_tax_type_per_econ_transactions_and_tax_jurisdiction_id(tax_jurisdiction_id,econ_transaction_id)
    results = DB[:view_all_taxes].select(:tax_type_id, :econ_transaction_id, :tax_type_name).distinct(:tax_type_id).exclude(:tax_type_id=>nil).where(:econ_transaction_id=>econ_transaction_id,:tax_jurisdiction_id=>tax_jurisdiction_id).all #Check whether I need distinct and exclue?
  end
  
  def self.all_tax_id_from_taxation(tax_jurisdiction_id,tax_type_id,filing_status_id)
    results = DB[:view_all_taxes].select(:tax_jurisdiction_id,:tax_type_id,:filing_status_id,:tax_id).distinct(:tax_id).exclude(:tax_id=>nil).where(:tax_jurisdiction_id=>tax_jurisdiction_id,:tax_type_id=>tax_type_id,:filing_status_id=>filing_status_id).all
  end
  
  def self.all_tax_rate_id_from_financial_year_and_currency(financial_year_id, currency_id)
    results = DB[:tax_rate].select(:financial_year_id,:currency_id,:tax_rate_id).distinct(:tax_rate_id).exclude(:tax_rate_id=>nil).where(:financial_year_id=>financial_year_id, :currency_id=>currency_id).all
  end
  
  def self.all_tax_rate_from_tax_id(tax_id)
    results = DB[:tax_levy].select(:tax_rate_id,:tax_id).distinct(:tax_levy_id).exclude(:tax_levy_id=>nil).where(:tax_id=>tax_id).all
  end
  
  def self.all_information_from_tax_levy_id(tax_rate_id)
    results = DB[:view_all_taxes].select(:tax_levy_id,:tax_bracket_id,:tax_linkage_id,:tax_rate_id,:tax_percentage,:tax_floor,:tax_ceiling,:credit_deduction_percentage).exclude(:tax_rate_id=>nil).where(:tax_rate_id=>tax_rate_id).all
  end
end