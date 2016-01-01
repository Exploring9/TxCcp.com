class Personal_object
  def initialize(params)
    @person_residence_country_id = normalize_person_residence_country_id(params);
    @personal_filing_status_id =normalize_person_filing_status_id(params);
    normalize_person_residence_country_id(params)
  end
  
  def normalize_person_residence_country_id(params)
    return params["personal_data_object"]["data_Person_Residence_Country"]
  end
  
  def normalize_person_filing_status_id(params)
    return params["personal_data_object"]["data_Person_Filing_Status"]
  end 
  
end