# U2.W6: Drawer Debugger


# I worked on this challenge [by myself].


# 2. Original Code

class Drawer

	attr_reader :contents

	# Are there any more methods needed in this class?  I dont think we need another method, but we never use the open or close method.

	def initialize
		@contents = []
		@open = true
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item(item)
		@contents << item
	end

	def remove_item(item = @contents.pop) #what is `#pop` doing? Pop is pulling out the last item on the stack. Which at this moment is a fork.
		@contents.delete(item)
	end

	def dump  # what should this method return? Should return an empty array of objects.
		puts "Your drawer is empty."
		@contents = []
	end

	def view_contents
		puts "The drawer contains:"
		@contents.each {|silverware| puts "- " + silverware.type }
	end
end



class Silverware
	attr_reader :type, :clean

	# Are there any more methods needed in this class?  Yes I created a new method called clean_silverware that will set @clean to true.
	def initialize(type, clean = true)
		@type = type
		@clean = clean
	end

	def eat
		puts "eating with the #{type}"
		@clean = false
	end

	def clean_silverware
		puts "Cleaning Silverware"
		@clean = true
	end
end

knife1 = Silverware.new("knife")
silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents
silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return? Should return a blank array.
fork = Silverware.new("fork")
silverware_drawer.add_item(fork)
fork = silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...  I had to create a new instance of Silverware for a fork and add the fork object to the silverware_drawer object.
fork.eat
fork.clean_silverware

#BONUS SECTION
puts fork.clean  #I added clean as an attr_reader to get the value of clean.   

# DRIVER TESTS GO BELOW THIS LINE
def assert
  raise "Assertion failed!" unless yield
end

testdrawer = Drawer.new
k = Silverware.new("knife")
f = Silverware.new("fork")
s = Silverware.new("spoon")
testdrawer.add_item(k)
testdrawer.add_item(f)
testdrawer.add_item(s)
 
#Test that the total objects are 3
assert { testdrawer.contents.length  == 3 }

#Test that the last object is a spoon
remove_s = testdrawer.remove_item(s)
assert { remove_s.type  == "spoon" }

#Test that taking a silverware out to eat makes it dirty
remove_s.eat
assert { remove_s.clean == false}

#Test that the silverware is clean after running the clean method.
remove_s.clean_silverware
assert { remove_s.clean == true }

#Test that the emptying a drawer returns an empty array after using the method dump.
testdrawer.dump
assert { testdrawer.contents.empty? == true }

#Writing 3 more method calls
testdrawer.view_contents 	#should contain nothing
testdrawer.open						#Open drawer
testdrawer.add_item(k)		#add a knife
testdrawer.view_contents	#show contents which is just a knife
testdrawer.close					#close drawer
testdrawer.remove_item		#remove the knife
testdrawer.view_contents	#should contain nothing

# 5. Reflection 
=begin
	This was an interesting challenge.  I never worked with passing in an object as an argument so it was a fun experience.   It does get a little confusing because passing in an object you then have to understand that the object also contain multiple methods and variables that you have to manage in your head.  I was not sure if I did this assignment absolutely correct.  The instruction on the challenge mentioned adjusting and adding in methods to the class.   So my initial thought was that we can ONLY change things inside the class, but in order for me to make the fork.eat method to work is if I created a new instance of fork and added it the silverware_drawer instance.   I added the code into the area outside of the class to get it all working.   The assert driver code wasnt too bad.   I basically wrote out comments on what I want to test and then I wrote the test code to see if it will return true.    I then also made the test equal to the opposite to make sure it is throwing the assert error.   I am slowly learning more about how to work with objects and attr.  I felt fairly confident about the learning objectives.   
=end