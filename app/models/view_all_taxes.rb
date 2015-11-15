#Sequel::Model.plugin(:validation_helpers)
require 'models_helper/view_all_taxes_helper'
class View_all_taxes < Sequel::Model
  extend View_all_taxesHelper
  
end