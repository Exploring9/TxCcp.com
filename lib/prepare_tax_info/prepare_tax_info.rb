require '.../../../app/helpers/home_helper_tax_calculation'
#Use it to create presentable tax info
class Prepare_tax_info
  attr_accessor :full_html
  
  def initialize()
    @full_html = create_html_tax_calculator();
  end
  
  def create_html_tax_calculator()
    Convert_to_html.convert_to_html_text_tax_calculations()
  end
end