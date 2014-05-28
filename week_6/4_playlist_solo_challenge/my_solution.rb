# U2.W6: Create a Playlist from Driver Code

# I worked on this challenge [by myself].

# Pseudocode
=begin
	Create a new class Song
	Create an attr_reader so you can access the the songtitle and artist
	Initialize the class by passing in 2 arguments, songtitle and artist
	Create a method called play that will "play" the song and display the songtitle and artist.

	Create a new class Playlist
	Initialize the class by passing in a splat argument and assign it to the instance variable @song.   This will allow you to add in as many song objects at once.
	Create a new method called add that takes in a splat argument that will allow you to add in as many song objects at once after you initialized the Playlist object.
	Create a new method called num_of_tracks that returns the number of songs in the playlist
	Create a new method called remove that takes in 1 argument to delete a song from the playlist
	Create a new method called includes? that takes in 1 argument to check the playlist to see if a song exist on the list.
	Create a new method called play_all that will "play" all the song and list each song by songtitle and artist.
	Create a new method called display that will display the current playlist.
=end


# Initial Solution
class Song
	attr_reader :songtitle, :artist

	def initialize(songtitle, artist)
		@songtitle = songtitle
		@artist = artist
	end

	def play
		puts "Playing #{@songtitle} by #{@artist}"
	end
end

class Playlist
	def initialize(*songs)
		@songs = songs
	end

	def add(*songs)
		songs.each do |s|
			@songs << s
		end
	end

	def num_of_tracks
		@songs.length
	end

	def remove(song)
		@songs.delete(song)
	end

	def includes?(song)
		@songs.include?(song)
	end

	def play_all
		puts "Playing all songs"
		@songs.each do |a|
			puts "Now playing Song Title: #{a.songtitle} - Artist: #{a.artist}"
		end
	end

	def display
		puts "Here's the current playlist"
		@songs.each do |a|
			puts "Song Title: #{a.songtitle} - Artist: #{a.artist}"
		end
	end
end


# Refactored Solution
#I'm not sure where I can refactor the code. Everything is pretty lean and DRY.   I do feel that my play_all and display methods are basically doing the same thing, but the driver test requires the methods.

# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display

#MY DRIVER TEST CODE
def assert
  raise "Assertion failed!" unless yield
end

#Call the number of tracks, should equal 4
assert { my_playlist.num_of_tracks == 4 }

#Confirm adding a new track will make the playlist equal 5
get_lucky = Song.new("Get Lucky","Daft Punk")
my_playlist.add(get_lucky)
assert { my_playlist.num_of_tracks == 5 }
my_playlist.display

#Confirm that get_lucky is actually storing "Get Lucky" as the song title and "Daft Punk" as the artist
assert { get_lucky.songtitle == "Get Lucky" }
assert { get_lucky.artist == "Daft Punk" }

#Confirm deletion of get_lucky
my_playlist.remove(get_lucky)
assert { my_playlist.includes?(get_lucky) == false }

# Reflection 
=begin
	This was a very fun challenge.    Looking at the different methods being called and the instance creation from two classes gave me enough information on what classes needs to be created and also what methods we need for each class.   Taking example code from the previous challenge 2, I based my code off of the Drawer and Silverware class.   My assert checks was not hard to create, generating new Song instances and adding them to the playlist was fun.   I did have to look on the Ruby api doc to confirm how to use the include? method.    Overall I believe I understand all the learning competencies and I did not find the challenge tedious in any way.
=end