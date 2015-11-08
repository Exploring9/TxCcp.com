Sequel.migration do
  up do
    Database_Sequel::DB.run(
    "CREATE VIEW all_taxes AS
    SELECT 
    taxation.tax_jurisdiction_id,
    COALESCE(taxation.tax_id,tax_levy.tax_id)
    AS tax_id,
    COALESCE(taxation.filing_status_id,filing_status.filing_status_id)
    AS filing_status,
    filing_status.filing_status_name,
    COALESCE(taxation.tax_type_id,tax_type.tax_type_id)
    AS tax_type_id,
    tax_type.tax_type_name,
    COALESCE(tax_type.econ_transaction_id,tax_type.econ_transaction_id)
    AS econ_transaction_id,
    econ_transaction.econ_transaction_name,
    financial_year.financial_year_name,
    tax_levy.tax_levy_id,
    COALESCE(tax_rate.tax_rate_id,tax_levy.tax_rate_id)
    AS tax_rate_id,
    tax_rate_has_tax_bracket.tax_linkage_id,
    COALESCE(tax_rate_has_tax_bracket.tax_bracket_id, tax_bracket.tax_bracket_id)
    AS tax_bracket_id,
    tax_bracket.tax_percentage,
    tax_bracket.tax_floor,
    tax_bracket.tax_ceiling,
    currency.currency_name
    FROM taxation
    FULL OUTER JOIN filing_status
    ON taxation.filing_status_id = filing_status.filing_status_id
    FULL OUTER JOIN tax_type
    ON taxation.tax_type_id = tax_type.tax_type_id
    FULL OUTER JOIN econ_transaction
    ON tax_type.econ_transaction_id = econ_transaction.econ_transaction_id
    FULL OUTER JOIN tax_levy
    ON taxation.tax_id = tax_levy.tax_id
    FULL OUTER JOIN tax_rate
    ON tax_levy.tax_rate_id = tax_rate.tax_rate_id
    FULL OUTER JOIN tax_rate_has_tax_bracket
    ON tax_rate.tax_rate_id = tax_rate_has_tax_bracket.tax_rate_id
    FULL OUTER JOIN tax_bracket
    ON tax_bracket.tax_bracket_id = tax_rate_has_tax_bracket.tax_bracket_id
    FULL OUTER JOIN financial_year
    ON tax_rate.financial_year_id = financial_year.financial_year_id
    FULL OUTER JOIN currency
    ON tax_rate.currency_id = currency.currency_id;"
    )
  end
  
  down do
    drop_view(:all_taxes)
  end
end