Sequel.migration do
  up do
    create_table(:tax_bracket) do   
      primary_key :tax_bracket_id
      Float :tax_sum
      Float :tax_percentage
      Float :tax_floor
      Float :tax_ceiling
      String     :credit_deduction_percentage, :size=>20, :null => false
      

    end
  end
  
  down do
    drop_table(:tax_bracket)
  end
end

#Contrastraint 
# 1 Tax floor is below Tax ceiling
# 2 Break up tax sums