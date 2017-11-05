class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : name = self.new(name)
  end

  def self.find(name)
    @@all.find {|artist| artist.name == name }
  end

  # def self.find_or_create_by_name(name)
  #   if @@all.include?(name)
  #     return
  #   else
  #     name = Artist.new(name)
  #   end
  # end

  def self.all
    @@all
  end


  def add_song(song)
    @songs << song
  end

  def print_songs
    @songs.each {|x| puts(x.name)}
  end




end
