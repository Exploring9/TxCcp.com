Sequel.migration do
  up do
    Database_Sequel::DB.run(
   'CREATE VIEW all_filing_status AS
    SELECT 
    filing_status.filing_status_id, filing_status.filing_status_name,
    tax_jurisdiction_and_filing_status.description_id,
    tax_jurisdiction.tax_jurisdiction_id,
    COALESCE (country.country_id, region.country_id) AS country_id,
    country.country_name,
    country.country_abbreviation,
    region.region_id, region.region_name,
    region.region_abbreviation
    FROM 
    filing_status
    FULL OUTER JOIN tax_jurisdiction_and_filing_status
    ON tax_jurisdiction_and_filing_status.filing_status_id = filing_status.filing_status_id
    FULL OUTER JOIN tax_jurisdiction
    ON tax_jurisdiction_and_filing_status.tax_jurisdiction_id = tax_jurisdiction.tax_jurisdiction_id
    FULL OUTER JOIN country
    ON tax_jurisdiction.tax_jurisdiction_id = country.tax_jurisdiction_id
    FULL OUTER JOIN region
    ON region.tax_jurisdiction_id = tax_jurisdiction.tax_jurisdiction_id;'
    )
  end
  
  down do
    drop_view(:all_filing_status)
  end
end