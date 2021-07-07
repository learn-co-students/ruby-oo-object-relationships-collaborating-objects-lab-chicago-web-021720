require 'pry'
class MP3Importer
    attr_accessor :path

    def initialize(file_path)
        self.path = file_path
    end

    #inputs: takes initialized file path and creates array of all files with Dir
    #outputs: iterates through array of files and removes the initialized file path
    #leaving just the name of the mp3 file. 
    def files
        file = Dir[self.path + "/*"]
        file.each do |file_name|
            file_name.slice!(self.path + "/")
        end
        file
    end

    def import 
        file_array = self.files
        file_array.each do |file|
            Song.new_by_filename(file)
        end
    end
end