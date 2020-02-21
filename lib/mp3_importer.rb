class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    Dir.entries(self.path).select{|file_name| file_name.length > 3}
  end
  def import
    self.files.map do |str|
      Song.new_by_filename(str)
    end
  end
end
