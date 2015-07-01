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
  
  def self.check_migrations()
    puts "Checking for Migrations - Comment it out if you don't want 
    to run the migrations"
    Sequel.extension :migration
    #I commented it out so it doesn't automatically run a migration
    Sequel::Migrator.run(DB, './db/sequel_migrate')
    Sequel::Migrator.check_current(DB, './db/sequel_migrate')
  end
end

Database_Sequel::establish_connection()
Database_Sequel::check_migrations()
