# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT * FROM albums;'
result = DatabaseConnection.exec_params(sql, [])

#result.each do |record|
#  p record
  #Prints out each record from the result set as a hash
#end

#Video tutorial replaces the result.each method above with the code below
#gives an "uninitialized constant 'ArtistRepository' (NameError) if you don't require the artist_repository file"
#An instance of the ArtistRepository.new is saved to the artist_repo variable
artist_repo = ArtistRepository.new 

#p artist_repo.all #returns an array of all the records as instance variables from the model class method

artist_repo.all.each do |artist|
  p artist
end

