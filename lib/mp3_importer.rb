require "pry"

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
