class MP3Importer
    attr_accessor :path

    def initialize(filepath)
        @path = filepath
    end

    def files
        Dir.entries(self.path).select {|n| n[0] != "."}
    end

    def import
        self.files.each {|filename| Song.new_by_filename(filename)}
    end
end