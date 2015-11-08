Sequel.migration do
  up do
  Database_Sequel::DB.run(
      "CREATE VIEW all_territories AS SELECT 
      tax_jurisdiction.tax_jurisdiction_id,
      country.tax_jurisdiction_id AS country_tax_jurisdiction_id,
      country.country_id,
      country.country_name,
      region.region_id,
      region.region_name,
      region.country_id AS region_country_id,
      region.tax_jurisdiction_id AS region_tax_jurisdiction_id,
      COALESCE (country.country_id, region.country_id) AS all_entries_country_id
      FROM tax_jurisdiction 
      FULL OUTER JOIN 
      region ON tax_jurisdiction.tax_jurisdiction_id = region.tax_jurisdiction_id
      FULL OUTER JOIN
      country ON tax_jurisdiction.tax_jurisdiction_id = 
      country.tax_jurisdiction_id;"      
    )
  end
  
  down do 
    drop_view(:all_countries)
  end
end
=begin
#The SQL that I want to write is:
CREATE VIEW all_countries AS 
SELECT tax_jurisdiction.tax_jurisdiction_id, country.country_name, country.country_id
FROM tax_jurisdiction
FULL JOIN country ON (tax_jurisdiction.tax_jurisdiction_id = country.tax_jurisdiction_id)
=end