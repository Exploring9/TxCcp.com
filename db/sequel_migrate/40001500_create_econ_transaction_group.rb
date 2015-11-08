Sequel.migration do
  up do
    create_table(:econ_transaction_group) do
      primary_key :econ_transaction_group_id
      String      :econ_transaction_group_name, :size=>100, :null=>false
    end
  end
  
  down do
    drop_table(:econ_transaction_group)
  end
end