class Personal_object
  attr_reader :data_Person_Residence_Country, :data_Person_Filing_Status
  def initialize(params)
    @data_Person_Residence_Country = normalize_person_residence_country_id(params);
    @data_Person_Filing_Status =normalize_person_filing_status_id(params);
    normalize_person_residence_country_id(params)
  end
  
  def normalize_person_residence_country_id(params)
    return params["personal_data_object"]["data_Person_Residence_Country"]
  end
  
  def normalize_person_filing_status_id(params)
    return params["personal_data_object"]["data_Person_Filing_Status"]
  end 
  
end