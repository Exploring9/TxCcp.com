Sequel.migration do
  up do
    create_table(:posts) do
      primary_key :post_id
      String :title,                  :null=>false
      String :body, :text=>true,      :null=>false
      String :post_type,              :null=>false
      Time   :create,                 :null=>false
      Time   :update,                 :null=>false
    end
  end
  
  down do
    drop_table(:posts)
  end
end