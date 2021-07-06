require_relative 'artist.rb'
require_relative 'mp3_importer.rb'

class Song
    attr_accessor :name, :artist
    @@all = []


    def initialize(name)
        @name = name 
        @@all << self
    end 

    def self.all
        @@all 
    end 

    def self.new_by_filename(file)
        this_file = file.split(" - ")
        new_song = self.new(this_file[1])
        new_song.artist_name = this_file[0]

        new_song
        
     
        
        # expect(new_instance.artist.name).to eq('Michael Jackson')
        #it 'creates a new instance of a song from the file that\'s passed' do
        #    file_name = 'Michael Jackson - Black or White - pop.mp3'
        #    new_instance = Song.new_by_filename(file_name)
        #    expect(new_instance.name).to eq('Black or White')
        #  end
      
        #  it 'associates new song instance with the artist from the filename' do
        #    Artist.class_variable_set("@@all",[])
        #    file_name = 'Michael Jackson - Black or White - pop.mp3'
      
        #    new_instance = Song.new_by_filename(file_name)
        #    expect(new_instance.artist.name).to eq('Michael Jackson')
        #    expect(Artist.all.size).to eq(1)
        #    expect(Artist.all.first.songs.empty?).to eq(false)
        #  end
    end 

    def artist_name=(name)
        desired_artist = Artist.all.find { |n| n.name == name }
        if desired_artist.nil?
            new_artist = Artist.new(name)
            self.artist = new_artist
            
        else 
            self.artist = desired_artist
        end      
    end 


end 