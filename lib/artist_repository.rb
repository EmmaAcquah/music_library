require_relative './artist'

class ArtistRepository
    def all
        sql = 'SELECT id, name, genre FROM artists;'
        result_set = DatabaseConnection.exec_params(sql, [])
    
        artists = []

        result_set.each do |record|
            artist = Artist.new #creates a new instance of the model class
            
             #assigns the attributes (columns) from the sql query to an objects in ruby
             #the order the instance variables are listed in below sets the order the attributes are displayed when each iteration is returned from the app.rb file
            artist.id = record['id']
            artist.name = record['name']
            artist.genre = record['genre']

            artists << artist #adds each record to the empty artist array created above
        end

        return artists
        
    end
    
end
