# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#These are custom seeds for the sequel database
# I used the ISO 3166 for the country and territory abbreviations
module TxCcp_Seeds
  def self.data_40001000_tax_jurisdiction()
      dataset = Database_Sequel::DB[:tax_jurisdiction]
      dataset.import([:tax_jurisdiction_id],[[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52]])
end

  def self.data_40001010_description()
    dataset = Database_Sequel::DB[:description]
    dataset.import([:description_id,:description,:description_group_name],[[1,"single childless independent individual","filing_status-individual"],[2,"married individual filing separately","filing_status-married"],[3,"individual with dependents","filing_status-individual"],[4,"Married family","filing_status-married"],[5,"Widow with children","filing_status-married"],[6,"IRS - Tax Topic 401 - Wages and Salaries","Income tax - Labour"],[7,"IRS - Tax Topic 403 - Interest Received","Income tax - Intrest"],[8,"IRS - Tax Topic 404 - Dividends","Income tax - Dividends"],[9,"IRS - Tax Topic 407 - Business Income","Income tax - Self-Employment"],[10,"IRS - Tax Topic 409 - Capital Gains and Losses","Income tax - Capital"]])
  end

  def self.data_40001100_country()
    dataset = Database_Sequel::DB[:country]
    dataset.import([:tax_jurisdiction_id, :country_id, :country_name,:country_abbreviation],[[52,1,"United States of America","US"]])
  end
  
  def self.data_40001200_state()
    dataset = Database_Sequel::DB[:region]
    dataset.import([:region_id,:country_id,:tax_jurisdiction_id,:region_name,:region_abbreviation],[[1, 1, 1, "Alabama","AL"], [2, 1, 2, "Alaska","AK"], [3, 1, 3, "Arizona","AZ"], [4, 1, 4, "Arkansas","AR"], [5, 1, 5, "California","CA"], [6, 1, 6, "Colorado","CO"], [7, 1, 7, "Connecticut","CT"], [8, 1, 8, "Delaware","DE"], [9, 1, 9, "Florida","FL"], [10, 1, 10, "Georgia","GA"], [11, 1, 11, "Hawaii","HI"], [12, 1, 12, "Idaho","ID"], [13, 1, 13, "Illinois","IL"], [14, 1, 14, "Indiana","IN"], [15, 1, 15, "Iowa","IA"], [16, 1, 16, "Kansas","KS"], [17, 1, 17, "Kentucky","KY"], [18, 1, 18, "Louisiana","LA"], [19, 1, 19, "Maine","ME"], [20, 1, 20, "Maryland","MD"], [21, 1, 21, "Massachusetts","MA"], [22, 1, 22, "Michigan","MI"], [23, 1, 23, "Minnesota","MN"], [24, 1, 24, "Mississippi","MS"], [25, 1, 25, "Missouri","MO"], [26, 1, 26, "Montana","MT"], [27, 1, 27, "Nebraska","NE"], [28, 1, 28, "Nevada","NV"], [29, 1, 29, "New Hampshire","NH"], [30, 1, 30, "New Jersey","NJ"], [31, 1, 31, "New Mexico","NM"], [32, 1, 32, "New York","NY"], [33, 1, 33, "North Carolina","NC"], [34, 1, 34, "North Dakota","ND"], [35, 1, 35, "Ohio","OH"], [36, 1, 36, "Oklahoma","OK"], [37, 1, 37, "Oregon","OR"], [38, 1, 38, "Pennsylvania","PA"], [39, 1, 39, "Rhode Island","RI"], [40, 1, 40, "South Carolina","SC"], [41, 1, 41, "South Dakota","SD"], [42, 1, 42, "Tennessee","TN"], [43, 1, 43, "Texas","TX"], [44, 1, 44, "Utah","UT"], [45, 1, 45, "Vermont","VT"], [46, 1, 46, "Virginia","VA"], [47, 1, 47, "Washington","WA"], [48, 1, 48, "West Virginia","WV"], [49, 1, 49, "Wisconsin","WI"], [50, 1, 50, "Wyoming","WY"]])
  end
  
  def self.data_40001300_filing_status()
    dataset = Database_Sequel::DB[:filing_status]
    dataset.import([:filing_status_id,:filing_status_name],[[1,"Single"],[2,"Married filing separately"],[3,"Head of household"],[4,"Married filing jointly"],[5,"Qualifying widow(er) with dependent child"]])
  end
 
  def self.data_40001400_tax_jurisdiction_and_filing_status()
    dataset = Database_Sequel::DB[:tax_jurisdiction_and_filing_status]
    dataset.import([:tax_jurisdiction_id,:filing_status_id,:description_id],[[52,1,1],[52,2,2],[52,3,3],[52,4,4],[52,5,5]]
    )
  end
  
  def self.data_40001500_econ_transaction_group()
    dataset = Database_Sequel::DB[:econ_transaction_group]
    dataset.import([:econ_transaction_group_id,:econ_transaction_group_name],[[1,"Labour"],[2,"Interest"],[3,"Dividends"],[4,"Business income (Pass through)"],[5,"Capital"],[6,"Pensions and Annuities"],[7,"Rent"],[8,"Farming/Fishing income"],[9,"Religious"],[10,"Welfare"],[11,"Gambling"],[12,"Bartering"],[13,"Private welfare (Scholarships/Grants)"],[14,"Other"]])
  end
  
  def self.data_40001510_econ_transaction()
    dataset = Database_Sequel::DB[:econ_transaction]
    dataset.import([:econ_transaction_id,:econ_transaction_name,:econ_transaction_group_id],[[1,"Wages and Salaries",1],[2,"Interest Received",2],[3,"Dividends",3],[4,"Business Income",4],[5,"Capital Gains and Losses",5]])
  end
  
  def self.data_40001520_tax_jurisdiction_and_econ_transaction()
    dataset = Database_Sequel::DB[:tax_jurisdiction_and_econ_transaction]
    dataset.import([:econ_transaction_id,:tax_jurisdiction_id,:description_id],[[1,52,6],[2,52,7],[3,52,8],[4,52,9],[5,52,10]])
  end
  
  def self.data_40001600_tax_type()
    dataset = Database_Sequel::DB[:tax_type]
    dataset.import([:tax_type_id,:tax_type_name,:econ_transaction_id],[[1,"Labour Taxation",1],[2,"Interest Taxation",2],[3,"Dividends Taxation",3],[4,"Business Income Taxation",4],[5,"Capital Gains Taxation",5]])
  end
  
  def self.data_40001700_taxation()
    dataset = Database_Sequel::DB[:taxation]
    dataset.import([:tax_id,:filing_status_id,:tax_jurisdiction_id,:tax_type_id],[[1,1,52,1],[2,1,52,2],[3,1,52,3],[4,1,52,4],[5,1,52,5],[6,2,52,1],[7,3,52,1],[8,4,52,1],[9,5,52,1]])
  end
  
  def self.data_40001800_currency()
    dataset = Database_Sequel::DB[:currency]
    dataset.import([:currency_id,:currency_name,:iso4217code,:tax_jurisdiction_id],[[1,"United States dollar","USD",52]])
  end
  
  def self.data_40001900_financial_year()
    dataset = Database_Sequel::DB[:financial_year]
    dataset.import([:financial_year_id,:start_of_financial_year,:end_of_financial_year,:financial_year_name,:payment_date,:tax_jurisdiction_id],[[1,"20150101","20151231","2015 - Financial year US","20160418",52]])
  end
  
  def self.data_40002000_tax_rate()
    dataset = Database_Sequel::DB[:tax_rate]
    dataset.import([:tax_rate_id,:financial_year_id,:currency_id],[[1,1,1],[2,1,1],[3,1,1],[4,1,1],[5,1,1]])
  end

  def self.data_40002100_tax_levy()
    dataset = Database_Sequel::DB[:tax_levy]
    dataset.import([:tax_levy_id,:tax_id,:tax_rate_id],[[1,1,1],[2,6,2],[3,7,3],[4,8,4],[5,9,5]])
  end
  
  def self.data_40002200_tax_bracket()
    dataset = Database_Sequel::DB[:tax_bracket]
    dataset.import([:tax_bracket_id,:tax_sum,:tax_percentage,:tax_floor,:tax_ceiling, :credit_deduction_percentage],[[1,0,10,0,9225,"N/A"],[2,0,15,9225,37450,"N/A"],[3,0,25,37450,90750,"N/A"],[4,0,28,90750,189300,"N/A"],[5,0,33,189300,411500,"N/A"],[6,0,35,411500,413200,"N/A"],[7,0,39.6,413200,999999999,"N/A"],[8,0,10,0,9225,"N/A"],[9,0,15,9225,37450,"N/A"],[10,0,25,37450,75600,"N/A"],[11,0,28,75600,115225,"N/A"],[12,0,33,115225,205750,"N/A"],[13,0,35,205750,232425,"N/A"],[14,0,39.6,232425,999999999,"N/A"],[15,0,10,0,13150,"N/A"],[16,0,15,13150,50200,"N/A"],[17,0,25,50200,129600,"N/A"],[18,0,28,129600,209850,"N/A"],[19,0,33,209850,411500,"N/A"],[20,0,35,411500,4396000,"N/A"],[21,0,39.6,4396000,999999999,"N/A"],[22,0,10,0,18450,"N/A"],[23,0,15,18450,74900,"N/A"],[24,0,25,74900,151200,"N/A"],[25,0,28,151200,230450,"N/A"],[26,0,33,230450,411500,"N/A"],[27,0,35,411500,464850,"N/A"],[28,0,39.6,464850,999999999,"N/A"]])
  end
  
  def self.data_40002300_tax_rate_has_bracket()
    dataset = Database_Sequel::DB[:tax_rate_has_tax_bracket]
    dataset.import([:tax_linkage_id,:tax_rate_id,:tax_bracket_id,:tax_bracket_number,:total_brackets],[[1,1,1,1,7],[2,1,2,2,7],[3,1,3,3,7],[4,1,4,4,7],[5,1,5,5,7],[6,1,6,6,7],[7,1,7,7,7],[8,2,8,1,7],[9,2,9,2,7],[10,2,10,3,7],[11,2,11,4,7],[12,2,12,5,7],[13,2,13,6,7],[14,2,14,7,7],[15,3,15,1,7],[16,3,16,2,7],[17,3,17,3,7],[18,3,18,4,7],[19,3,19,5,7],[20,3,20,6,7],[21,3,21,7,7],[22,4,22,1,7],[23,4,23,2,7],[24,4,24,3,7],[25,4,25,4,7],[26,4,26,5,7],[27,4,27,6,7],[28,4,28,7,7],[29,5,22,1,7],[30,5,23,2,7],[31,5,24,3,7],[32,5,25,4,7],[33,5,26,5,7],[34,5,27,6,7],[35,5,28,7,7]])
  end
=begin  
  def self.data_40001500_econ_transaction()
    dataset = Database_Sequel::DB(:A)
    // General tax
    // Wages and Salaries (Earned Income)
    // Dividend (Unearned Income)
    // Capital (Unearned Income)
    // Self-Employment Income ()
    
    #IRS - Tax Topics - Types of Income
  end
=end
  
end