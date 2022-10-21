require 'artist_repository'

RSpec.describe ArtistRepository do
    
    def reset_artists_table
        seed_sql = File.read('spec/seeds_artists.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_artists_table
    end

        it 'returns the list of all artists' do
            repo = ArtistRepository.new

            all_artists = repo.all #.all method defined in the ArtistRepository class file saved to the variable all_artists

            #instance of the ArtistRepository class, all_artists, is passed within the expect parentheses

            expect(all_artists.length).to eq(2) #.length ruby built-in method - using value 2 because there are only 2 records
            expect(all_artists[0].id).to eq('1')
            expect(all_artists[0].name).to eq('St Vincent')
            expect(all_artists[0].genre).to eq('Alternative')
        end
end

