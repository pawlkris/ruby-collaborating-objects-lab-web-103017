require "pry"

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    file = filename.split(" - ")[1]
    song = self.new(file)
    song.artist = filename.split(" - ")[0]
    Artist.find_or_create_by_name(song.artist)
    song
  end
end







class MP3Importer
  attr_reader :files, :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).select! { |file|file =~ /\A[A-Z]/}
  end

  def import
    @files.each{|filename| Song.new_by_filename(filename)}
  end
end
Pry.start
