Sequel.migration do
  up do
    Database_Sequel::DB.run(
    "CREATE VIEW view_all_taxes AS
 SELECT 
   COALESCE (tax_jurisdiction.tax_jurisdiction_id,taxation.tax_jurisdiction_id, country.tax_jurisdiction_id, region.tax_jurisdiction_id) AS tax_jurisdiction_id,
   COALESCE (country.country_id, region.country_id) AS country_id,
   country.country_name,
   country.country_abbreviation,
   region.region_id,
   region.region_name,
   region.region_abbreviation,
   COALESCE(taxation.tax_id, tax_levy.tax_id) AS tax_id,
   COALESCE(taxation.filing_status_id, filing_status.filing_status_id) AS filing_status_id,
   filing_status.filing_status_name,
   COALESCE(taxation.tax_type_id, tax_type.tax_type_id) AS tax_type_id,
   tax_type.tax_type_name,
   COALESCE(tax_type.econ_transaction_id, tax_type.econ_transaction_id) AS econ_transaction_id,
   econ_transaction.econ_transaction_name,
   COALESCE(econ_transaction.econ_transaction_group_id,econ_transaction.econ_transaction_group_id) AS econ_transaction_group_id,
   econ_transaction_group.econ_transaction_group_name,
   econ_transaction.tax_order_number,
   econ_transaction.tax_order_type,
   financial_year.financial_year_name,
   tax_levy.tax_levy_id,
   COALESCE(tax_rate.tax_rate_id, tax_levy.tax_rate_id) AS tax_rate_id,
   tax_rate_has_tax_bracket.tax_linkage_id,
   COALESCE(tax_rate_has_tax_bracket.tax_bracket_id, tax_bracket.tax_bracket_id) AS tax_bracket_id,
   tax_bracket.credit_deduction_percentage,
   tax_bracket.tax_percentage,
   tax_bracket.tax_floor,
   tax_bracket.tax_ceiling,
   currency.currency_name,
   currency.iso4217code
   FROM (((((((((taxation
     FULL JOIN tax_jurisdiction
     ON taxation.tax_jurisdiction_id = tax_jurisdiction.tax_jurisdiction_id
     FULL JOIN country
     ON country.tax_jurisdiction_id = tax_jurisdiction.tax_jurisdiction_id
     FULL JOIN region
     ON region.tax_jurisdiction_id = tax_jurisdiction.tax_jurisdiction_id
     FULL JOIN filing_status ON ((taxation.filing_status_id = filing_status.filing_status_id)))
     FULL JOIN tax_type ON ((taxation.tax_type_id = tax_type.tax_type_id)))
     FULL JOIN econ_transaction ON ((tax_type.econ_transaction_id = econ_transaction.econ_transaction_id)))
     FULL JOIN econ_transaction_group
     ON econ_transaction.econ_transaction_group_id = econ_transaction_group.econ_transaction_group_id
     FULL JOIN tax_levy ON ((taxation.tax_id = tax_levy.tax_id)))
     FULL JOIN tax_rate ON ((tax_levy.tax_rate_id = tax_rate.tax_rate_id)))
     FULL JOIN tax_rate_has_tax_bracket ON ((tax_rate.tax_rate_id = tax_rate_has_tax_bracket.tax_rate_id)))
     FULL JOIN tax_bracket ON ((tax_bracket.tax_bracket_id = tax_rate_has_tax_bracket.tax_bracket_id)))
     FULL JOIN financial_year ON ((tax_rate.financial_year_id = financial_year.financial_year_id)))
     FULL JOIN currency ON ((tax_rate.currency_id = currency.currency_id)));"
      )
  end
  
  down do
    drop_view(:all_taxes)
  end
end