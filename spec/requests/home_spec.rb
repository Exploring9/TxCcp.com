require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe "HomeSpec", type: :request do
  describe "GET /" do
    it "works! (now write some real specs)" do
      get '/'
      expect(response).to have_http_status(200)
    end
  end
  
  describe "Get / (capybara)" do
    
    it "visits the home page" do
      visit ('/')
      sleep(1)
      expect(page).to have_content("Tax Calculator - Phoenix™")
      sleep(1)
    end

    it "can't add income without personal details", :js => true do
      visit '/'
      find('body').click
      find('input[name=Button_Add_Income_Details]').click
      page.accept_alert('You need to enter this information:Personal Details') do
      end
    end
    
    it "can't create personal details without a country of residence", :just => true do
      visit '/'
      find('input[name=Button_Add_Personal_Details]').click
      page.accept_alert('You need to enter this information:data_Person_Residence_Country') do
      end
    end
    
   it "can't create personal details without a filling status", :just => true do
      visit '/'
      find('select[name=data_Person_Residence_Country]').find('option[value="52"]').click
      find('input[name=Button_Add_Personal_Details]').click
      page.accept_alert('You need to enter this information:data_Person_Filing_Status') do
      end
    end
    
    it "can't create income details without a location", :just => true do
      visit '/'
      find('select[name=data_Person_Residence_Country]').find('option[value="52"]').click
      find('select[name=data_Person_Filing_Status]').find('option[value="1"]').click
      find('input[name=Button_Add_Personal_Details]').click
      find('input[name=Button_Add_Income_Details]').click
      page.accept_alert('You need to enter this information:data_Income_Location_Country') do
      end      
    end

    it "can't create income details without a source", :just => true do
      visit '/'
      find('select[name=data_Person_Residence_Country]').find('option[value="52"]').click
      find('select[name=data_Person_Filing_Status]').find('option[value="1"]').click
      find('input[name=Button_Add_Personal_Details]').click
      find('select[name=data_Income_Location_Country]').find('option[value="52"]').click
      find('input[name=Button_Add_Income_Details]').click
      page.accept_alert('You need to enter this information:data_Income_Source') do
      end      
    end
    
    it "can't create income details without specifying the income's size", :just => true do
      visit '/'
      find('select[name=data_Person_Residence_Country]').find('option[value="52"]').click
      find('select[name=data_Person_Filing_Status]').find('option[value="1"]').click
      find('input[name=Button_Add_Personal_Details]').click
      find('select[name=data_Income_Location_Country]').find('option[value="52"]').click
      find('select[name=data_Income_Source]').find('option[value="1"]').click
      find('input[name=Button_Add_Income_Details]').click
      page.accept_alert('You need to enter this information:data_Income_Size') do
      end      
    end   
            
    it "click on body and get personal details", :js=>true do
      visit '/'
      find('body').click
      find('select[name=data_Person_Residence_Country]').find('option[value="52"]').click
      find('select[name=data_Person_Filing_Status]').find('option[value="1"]').click
      find('input[name=Button_Add_Personal_Details]').click
      
      expect(page).to have_content("name_data_Person_Residence_Country: United States of America")
      expect(page).to have_content("name_data_Person_Filing_Status: Single")
      expect(page).to have_selector('input[type="button"][name="Clear_Personal_Details"]')
      
      find(:xpath, '//input[@name="Clear_Personal_Details"]').click

      within('#Personal_Details_Data_Show') do
             expect(page).to have_no_content("name_data_Person_Filing_Status: Single") 
             expect(page).to have_no_content("name_data_Person_Residence_Country: United States of America")
      end

    end
    
    it "can create and delete income details", :just => true do
      visit '/'
      find('select[name=data_Person_Residence_Country]').find('option[value="52"]').click
      find('select[name=data_Person_Filing_Status]').find('option[value="1"]').click
      find('input[name=Button_Add_Personal_Details]').click
      find('select[name=data_Income_Location_Country]').find('option[value="52"]').click
      find('select[name=data_Income_Source]').find('option[value="1"]').click
      find('input[name=data_Income_Size]').set(500)
      find('input[name=Button_Add_Income_Details]').click
      
      expect(page).to have_css('input.economic_data_Object_Created_1')
      within('div#Income_Details_Show') do
        expect(page).to have_content("No of Income:1")
        expect(page).to have_content("name_data_Income_Location_Country: United States of America")
        expect(page).to have_content("name_data_Income_Source: Wages and Salaries")
        expect(page).to have_content("name_data_Income_Size: 500")
        expect(page).to have_selector('input[type="button"][name="Clear_Income_Details"]')  
      end
      
      find(:xpath, '//input[@class="economic_data_Object_Created_1"]').click
      
      within('div#Income_Details_Show') do
        expect(page).to have_no_content("No of Income:1")
        expect(page).to have_no_content("name_data_Income_Location_Country: United States of America")
        expect(page).to have_no_content("name_data_Income_Source: Wages and Salaries")
        expect(page).to have_no_content("name_data_Income_Size: 500")
        expect(page).to have_no_selector('input[type="button"][name="Clear_Income_Details"]')  
      end
      
      find('input[name=Button_Add_Income_Details]').click 
      expect(page).to have_css('input.economic_data_Object_Created_1')
      find('input[name=Button_Add_Income_Details]').click # This is to create the 2nd income
      expect(page).to have_css('input.economic_data_Object_Created_2')
    end        

    end   
end

=begin
  test "home page exist (capybara)" do
    visit('localhost:3000')
    expect(page).to have_content("Tax Calculator - Phoenix™")
    #assert_response :success #capybara uses someting else
  end
=end