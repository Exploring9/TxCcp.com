Sequel.migration do
  up do
    create_table(:description) do
      primary_key :description_id
      String      :description,   :text=>true,        :null => false
      String      :description_group_name, :size=> 100, :null => false
    end
    #TxCcp_Seeds::data_40001010_description()
  end
  
  down do
    drop_table(:description)
  end
end