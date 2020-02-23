require_relative 'artist.rb'
require_relative 'song.rb'
require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end 

    def files 
        get_files = Dir.entries(@path)
        get_files.select do |m| 
            m.end_with?("mp3")
        end
    end 

    def import
 

        files.each do |file|
            Song.new_by_filename(file)

        end 
    end 

end
