module View_all_taxesHelper
  include Database_Sequel
  
  def all_entries()
    all_entries = DB[:view_all_taxes].all
  end
  
  #All_countries are done
  def all_countries()
    all_countries = DB[:view_all_taxes].select(:country_name, :tax_jurisdiction_id).distinct(:tax_jurisdiction_id).exclude(:country_abbreviation=>nil).all
    return all_countries
  end
  
  #All_filig_statuses per tax_jurisdiction_id
  def all_filing_statuses(tax_jurisdiction_id)
    all_filing_statuses = DB[:view_all_taxes].select(:filing_status_id,:filing_status_name).distinct(:filing_status_id).exclude(:filing_status_id=>nil).where(:tax_jurisdiction_id=>tax_jurisdiction_id).all
  end
  
  #All_econ_transactions per tax_jurisdiction_id
  def all_econ_transactions(tax_jurisdiction_id)
    all_econ_transactions = DB[:view_all_taxes].select(:econ_transaction_id, :econ_transaction_name).distinct(:econ_transaction_id).exclude(:econ_transaction_id=>nil).where(:tax_jurisdiction_id=>tax_jurisdiction_id).all
  end
  
end