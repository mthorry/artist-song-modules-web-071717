require 'pry'

class Song
  extend Memorable
  attr_accessor :name
  attr_reader :artist

  @@songs = []

  def initialize      # adds song instance to @@song array
    @@songs << self   # each time a new song is created
  end

  def self.find_by_name(name) # iterates through @@songs array to find
    @@songs.detect{|a| a.name == name}  # songs by song name
  end

  def artist=(artist) # sets artist name equal to artist instance
    @artist = artist
  end

  def to_param # takes song name, makes it lower case, changes spaces
    name.downcase.gsub(' ', '-')  # to dashes
  end


  def self.all # prints all songs in @@songs
    @@songs
  end
end
