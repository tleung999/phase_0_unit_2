# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode

# What is the input? separate_comma(someintegervalue)
# What is the output? (i.e. What should the code return?) return a command separated string
# What are the steps needed to solve the problem?
=begin
Create a new method called separate_comma which can take in 1 arguement.   Arguement is an integer
Take the integer and convert it to a string.
Check to see if the string length is greater than 3
If string length is greater than 3 then run the following
	Create a variable called backnums and set it equal to the back 3 characters
	Create a variable called frontnums and set it equal to the leftover characters after the chop
	Using recursion, call itself again and pass in frontnums
	Create a variable called merge and set it equal to the result of the recursion call.
	return the results of the variable merge concatenated with the backnum variable.
If string length is not greater than 3 then just return the original string.
=end


# 2. Initial Solution
def separate_comma(mynum)
	strnum = mynum.to_s			#convert integer to string if not converted already
	if strnum.length > 3 		#Check to see if the number string is longer than 3 digits
		backnums =  strnum[strnum.length-3..strnum.length]		#Chop off the last 3 digits
		frontnums = strnum[0..strnum.length-4]								#Remaining characters in the string
		merge = separate_comma(frontnums)											#recursive call passing the remaining chars 
		return merge.concat(backnums.insert(0,','))						#Take results of the recursive call, concat with backnum with comma in front.
	end
	strnum								#If number is not longer than 3 digits, just return the original string
end

# 3. Refactored Solution
=begin
	I honestly do not have a refactored version of this.    If I wrote my original Pseudo code shown below in the
	reflection, then my refactored code could have been my initial solution.   When I was writing my original 
	pseudo code, I saw some repetition, and it seemed like there has to be something I need to do using recursion.
	I also realized that my initial pseudo code will not cover all basis.  It will max out at 999,999,999,999. if
	I go larger, then it will break and I wont have commas when I hit trillions.
=end


# 4. Reflection 
=begin
The strategy that really worked for me for this challenge was when I initally wrote up my pseudo code.  When 
I saw that I seem to be repeating myself, I knew I had to do a loop or some type of recursion.   So thinking about
the problem deeper, I decided to chop off the back 3 chars and have two string variables to manage.   The first
is the back string and the other one was the front string.   I would continously chop off 3 chars each 
time the method is called until the remaining string is less than 3 chars.   Thats when I knew I reached the end,
and the recursion should start moving back up the chain.   As it move back up it will return first the beginning of 
the number string merged with the current function's backnum which is ",000" for example.   It will keep merging 
all the way back up the chain till the recursion is complete.

I've read about and seen recursion in action, but this is my first exercise where I wrote my own recursion code.   
I am getting better at understanding how to use different methods and either chaining them together or making use of
returned values.

I really enjoyed working on this project.  It was a little hard to put together since I had to figure out where I am
at in the recursion.  

My original pseudo code is below.
Create a new method called separate_comma which can take in 1 arguement.   Argument is an integer
Take the integer and convert it to a string.
Break the string up into characters
If the string has 3 characters or less, do nothing
If the string has 4 characters, put a comma in between the 3rd and 4th slot.
If the string has 7 characters, put a comma in between the 3rd and 4th slot and between the 6th and 7th slot.
If the string has 10 characters, put a comma in between the 3rd and 4th slot, 6th and 7th slot, and 9th and 10th slot.
Return the string
=end
