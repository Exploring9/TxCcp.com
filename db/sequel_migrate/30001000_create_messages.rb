Sequel.migration do
  up do
    create_table(:messages) do
      primary_key :message_id
      String :name,  :size=>100,    :null=>false
      String :email, :size=>100,    :null=>false
      String :content,   :null=>false
      Time   :create,    :null=>false
      Time   :update,    :null=>false
    end
  end
  
  down do
    drop_table(:messages)
  end
end