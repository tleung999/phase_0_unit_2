# U2.W4: Create Accountability Groups


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: Takes in an array of names
# Output: Outputs a list of accountability group for 3 units.
# Steps:
=begin
Create a method called Cohort that will take in an array as an argument
If the total number of students are divisible by 4, we have the exact number needed to fill all slots evenly
	Calculate the number of groups we need by taking the number of students divided by 4
If not divisible by 4, we have extra students, so create an extra group to stick them in.
Take the array list and shuffle it
Break up the array into groups of 4
Create a hash list to save the groups.   Each key (group#) has an array of students.
Run a loop as many times as the number of groups.  So if total groups are 6, loop it 6 times.
	Inside each loop iteration, insert the array of students into each group key.
Return the final group list as a hash back to the caller.
=end

# 3. Initial Solution
students = ["Ariel Fogel", "Hethe Berg", "Premila Anand", "Brian Junio", "John Akers", "Chandler Smith", "Gannon Curran", "Tony Leung", "Arik Gadye", "Allison Reilly", "Justin Harnoss", "Morgan O'Leary", "Puru Dahal", "Alex White", "Michele Murphy", "Matthew Darin", "Steven Leu", "Patrick Reynolds", "Lauren Kroner", "Albert Alquisola", "Ernie Salazar", "Jared K. Chevalier", "William Pangestu"]
=begin
def Cohort array
	if array.length % 4 == 0
		totalgrp = array.length/4
	else
		totalgrp = array.length/4 + 1
 	end

	arrshuf = array.shuffle
	grplist = arrshuf.each_slice(4)
	
	finallist = {}

	i = 1
	while (totalgrp >= i)
		finallist["Group#{i}"] = grplist.next.to_a
		i += 1
	end
	finallist
end

puts "Unit 1 List"
puts Cohort(students).inspect
puts "**********************"
puts "Unit 2 List"
puts Cohort(students).inspect
puts "**********************"
puts "Unit 3 List"
puts Cohort(students).inspect
puts "**********************"
=end


# 4. Refactored Solution
def Cohort array
	finallist = {}
 	gpnum =  1
	array.shuffle.each_slice(4) do |curslice|
		finallist["Group#{gpnum}"] = curslice.to_a
		gpnum += 1
	end
	finallist
end

puts "Unit 1 List"
puts Cohort(students).inspect
puts "**********************"
puts "Unit 2 List"
puts Cohort(students).inspect
puts "**********************"
puts "Unit 3 List"
puts Cohort(students).inspect
puts "**********************"

# 1. DRIVER TESTS GO BELOW THIS LINE
#Is Cohort a Method and can it take 1 array argument
if Cohort(students) != nil
	puts true
end

#Does the Cohort Method return a hash?
puts Cohort(students).is_a?(Hash)

#Does each group only have a max of 4 people
hash = Cohort(students)
chk = false
hash.each_value do |val|
	if val.length <= 4
		chk = true
	end
end
puts chk

#Does a list of 23 names create 6 groups total to fill?
if hash.length == 6
	puts true
end

# 5. Reflection 
=begin
This challenge took the longest time since I had a really hard time trying to get the list of 23 names to be unique each time up to 
3 units.    I could get the first and second unit unique so that no students can group with each other again, but the third unit
no matter how I swapped the names, I could not make it unique.   I ended up just shuffling the array and calling the Cohort method
3 times to return a hash containing a shuffled version of each unit list.   Some other problems I faced was I did not know exactly how to
handle each_slice(#).   I didnt know how to use the block correctly so i ended up just assigning a variable without a block which
returned an enum.   The enum in the beginning I didnt know how to use until I found an example online which told me I had to call the
enum and use .next to call each piece of the 4 person array chunk.   That was why in my initial solution I had to keep track of how
many groups I needed so I can cycle through a while statement and keep calling .next till the iterator is equal to the 
total number of groups.   If I did not do that, it will return a stopIteration error.  My refactored version is much cleaner after 
I figured out how to build a block after the each_slice(x) method call.   

So in this challenge, i learned how to use the each_slice, each_value, and is_a method.   This challenge was the toughest out of
all the other challenges this week.   I spent two evenings (over 5 hours) pseudo coding the different permutations with no luck.   
=end