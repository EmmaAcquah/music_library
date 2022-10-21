# file: lib/database_connection.rb
# this file contains the connect method that the rspec_helper file will call using the name of the desired (test)database as the argument

require 'pg'

# This class is a thin "wrapper" around the
# PG library. We'll use it in our project to interact
# with the database using SQL.

class DatabaseConnection
  # This method connects to PostgreSQL using the
  # PG gem. We connect to 127.0.0.1, and select
  # the database name given in argument.
  # database name must be in single quotes ''
  def self.connect(database_name)
    @connection = PG.connect({ host: '127.0.0.1', dbname: database_name })
    #the database name doesn't need to be hardcoded within the method in single quotes
  end

  # This method executes an SQL query
  # on the database, providing some optional parameters
  # (you will learn a bit later about when to provide these parameters).
  def self.exec_params(query, params)
    if @connection.nil?
      raise 'DatabaseConnection.exec_params: Cannot run a SQL query as the connection to'\
      'the database was never opened. Did you make sure to call first the method '\
      '`DatabaseConnection.connect` in your app.rb file (or in your tests spec_helper.rb)?'
    end
    @connection.exec_params(query, params)
  end
end
