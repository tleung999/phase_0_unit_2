# U2.W4: Research Methods

i_want_pets = ["I", "want", 3, "pets", "but", "I", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, 
            "Annabelle" => 0, "Ditto" => 3}

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
  # Your code here!
end

def my_hash_finding_method(source, thing_to_find)
  # Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#

# Person 2
def my_array_modification_method(source, thing_to_modify)
  # Your code here!
end

def my_hash_modification_method(source, thing_to_modify)
  # Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#


# Person 3
def my_array_sorting_method(source)
  # Your code here!
end

def my_hash_sorting_method(source)
  # Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#


# Person 4
def my_array_deletion_method(source, thing_to_delete)
	source.each do |array|
		if array.to_s.index(thing_to_delete).to_i > 0
			source.delete(array) { "Nothing to delete" }
		end
	end
	source
end
def my_hash_deletion_method(source, thing_to_delete)
  		source.delete(thing_to_delete) { "Nothing to delete" }
	source
end

# Identify and describe the ruby method you implemented. 
# The ruby method I implemented is the delete method.  Delete is really simple and straight forward to use
# You just need to take the array pass it to the delete method and specify what array or hash key you 
# want deleted.   For my array example up above.    I had to iterate through the 
# array intially since I was only given the letter of what they wanted deleted.
# So if I said I want anything with the letter "a" deleted, I will have to go through
# each array element and check to see if it contains the letter "a".  I used the 
# .index method which I needed to pass a string to it.   If index find a matching letter,
# it will increment.   So I basically just set a condition that if we find any array element that
# has a matching letter, delete it using "arrayname".delete(arrayelement)
#
#The hash version of delete is even easier to implement.   You bascially just need to take the array and pass
#it to delete and specify what key you want deleted.    So in my example, I took the source array, passed it to 
#the delete method, set the key to thing_to_delete and it will return the source array without the key they 
#want deleted.  
#
#Also on both version of delete, there is an optional default value.   I just set it to equal the string "Nothing to delete."
#if it doesnt find anything that matches.
#Documentation here
#http://www.ruby-doc.org/core-2.1.2/Array.html#method-i-delete
#http://www.ruby-doc.org/core-2.1.2/Hash.html#method-i-delete

################## DRIVER CODE ###################################
# HINT: Use `puts` statements to see if you are altering the original structure with these methods. 
# Each of these should return `true` if they are implemented properly.

p my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]
p my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]
p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "I", "only", "have", 3 ]
p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]
p my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Bogart", 6], ["Poly", 6], ["Evi", 8], ["George", 14]] 
# This may be false depending on how your method deals with ordering the animals with the same ages.
p my_array_deletion_method(i_want_pets, "a") == ["I", 4, "pets", "but", "I", "only", 3 ]
p my_hash_deletion_method(my_family_pets_ages, "George") == {"Evi" => 8, "Hoobie" => 5, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}

# Reflect!
# I learned that its not easy to know and remember all the methods.   So its nice to see we divided up the task to help us understand and see some of these methods
# in action.   My delete method was really easy to use and it works the same way either with a hash or with an array.   I Had a little trouble passing the array 
# element to the index method.    Reason I believe it didnt work was because some of the array elements was an integer and so it threw an error when it saw the integer
# So my solution was to manually for all elements in the array to be a string by using to_s.   Then after when I was done running the index, for some reason I needed to
# convert it back to an int.  I dont know why, but after this it worked.   I didnt think this assignment was tedious, it was pretty fun.   I look forward to seeing
# everyone elses answers.
# 
# 
# 
# 