# U2.W4: Create Accountability Groups


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: Takes in an array of names
# Output: Outputs a list of accountability group for 3 units.
# Steps:
=begin
Create a method called Cohort that will take in an array as an argument
Take the array and randomize the list and save it as unit1list
Break up the array into groups of 4
Display the list of students
Any extra students left over becomes their own group.
Take the array and randomize the list again and save it as unit2list
Break up the array into groups of 4
Any extra students left over becomes their own group.
Display the list of students
Take the array and randomize the list again and save it as unit3list
Break up the array into groups of 4
Any extra students left over becomes their own group.
Display the list of students
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

	unit1list = array.shuffle
	unit2list = array.shuffle
	unit3list = array.shuffle
	
	slicelist1 = unit1list.each_slice(4)
	slicelist2 = unit2list.each_slice(4)
	slicelist3 = unit3list.each_slice(4)

	i = 1
	puts "Unit 1 List"
	while (totalgrp >= i)
		puts "Group#{i}"
		puts slicelist1.next
		puts "*******************"
		i += 1
	end

	i = 1
	puts
	puts "Unit 2 List"
	while (totalgrp >= i)
		puts "Group#{i}"
		puts slicelist2.next
		puts "*******************"
		i += 1
	end

	i = 1
	puts
	puts "Unit 3 List"
	while (totalgrp >= i)
		puts "Group#{i}"
		puts slicelist3.next
		puts "*******************"
		i += 1
	end

end

Cohort(students)

=end

# 4. Refactored Solution
def Cohort array
	#get the number of groups to make
	if array.length % 4 == 0
		totalgrp = array.length/4
	else
		totalgrp = array.length/4 + 1
 	end
 	
 	#iterate 3 times to create 3 total units
  unit = 1
	3.times do
		#shuffle the array and slice it up into chunks of 4 per group
		slicelist = array.shuffle.each_slice(4)
		puts "Unit #{unit} List" #display unit name
		i = 1
		#output each sliced chunk of 4 members without throwing a StopIteration error
		while (totalgrp >= i)	
			puts "Group#{i}" 	#display group name
			puts slicelist.next #output each group of 4s
			puts "*******************"
			i += 1 #move the next group
		end
		puts
		unit += 1 #move to next unit
	end
end

Cohort(students)


# 1. DRIVER TESTS GO BELOW THIS LINE
#Is Cohort a Method
if Cohort(students) != nil
	puts true
end
#Does Cohort take 1 array arguement
if Cohort(students, students) == nil
	puts true
end
#Does each group only have a max of 4 people

#Does the Cohort class create 3 result list






# 5. Reflection 


