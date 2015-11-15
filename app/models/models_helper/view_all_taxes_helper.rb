module View_all_taxesHelper
  include Database_Sequel
  
  def all_entries()
    all_entries = DB[:view_all_taxes].all
  end
  
end