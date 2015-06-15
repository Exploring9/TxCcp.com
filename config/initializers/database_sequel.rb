require "sequel"
# You need to use: Database_Sequel::DB to access the constant
module Database_Sequel
  
  def self.establish_connection()
    puts "Sequel Database Connection:"
    #This is to get the current state of the connection
    connection_details = Rails.configuration.database_configuration[Rails.env]
    puts connection_details
    self.const_set("DB",Sequel.postgres(
      :host=>      connection_details["host"],
      :user=>      connection_details["username"],
      :password=>  connection_details["password"],
      :database=>  connection_details["database"])
    )
    puts DB
    
  end

end

Database_Sequel::establish_connection()
