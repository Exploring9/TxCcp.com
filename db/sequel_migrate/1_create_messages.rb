Sequel.migration do
  up do
    create_table(:messages) do
      primary_key :id
      String :name,      :null=>false
      String :email,     :null=>false
      String :content,   :null=>false
    end
  end
  
  down do
    drop_table(:messages)
  end
end