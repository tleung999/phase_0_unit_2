# U2.W4: Research Methods

i_want_pets = ["I", "want", 3, "pets", "but", "I", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0, "Ditto" => 3}

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
  source.select { |iterator| iterator =~ /[#{thing_to_find}]/ }
end

def my_hash_finding_method(source, thing_to_find)
  updatehash = source.select { |key, value| value == thing_to_find }
  updatehash.keys
end

# Identify and describe the ruby method you implemented. 
# 
# The primary method used here is ".select". It returns a new entity, 
# in this case... a new hash or new array... consisting of what we looked
# for. For instance, in the first method (my_array_finding_method), I used
# .select, created an iterator... and then a regular expression to that states,
# if my iterator equals my "thing_to_find", keep it... else, let don't keep it.
# In the second method (my_hash_finding_method), we did a very similar task
# but as hashes have keys AND values, and we were looking for specific values,
# I had to just search over them and ONLY return the keys, which is what the second
# method ".keys" is doing.

# Person 2
def my_array_modification_method(source, thing_to_modify)
  source.map! do |element|
    if (element.is_a? Integer)
      element += thing_to_modify
    else
      element
    end
  end
  source
end

def my_hash_modification_method(source, thing_to_modify)
  source.map do |key, val| 
    source[key] = val + thing_to_modify
  end
  source
end

# Identify and describe the ruby method you implemented. 
# 
#
#


# Person 3
def my_array_sorting_method(source)
  source.length.times do |i|
    source[i] = source[i].to_s
  end
  source.sort
end

def my_hash_sorting_method(source)
  source.sort_by { |k, v| [v, k] }
end

# Identify and describe the ruby method you implemented. 
# .sort_by
# I actually found a site that showed how to configure it to sort hashes by the value first and then by the key… 
# I don’t really understand the syntax for this, but hopefully with additional practice, I’ll get it.
# .sort_by works on arrays and hashes, and lets you specify different criteria - for example you could say:
# a = [“loremat”, “spicy”, “ipso”, “dolor chicken fingers”]
# a.sort_by { |word| word.length}
# and get [“ipso”, “spicy”, “loremat”, “dolor chicken fingers”] as a result


# Person 4
def my_array_deletion_method(source, thing_to_delete)
	
  source.each do |value|
    if value.index(thing_to_delete) != nil
		  source.delete(value)
    end
	end
  source.length.times do |index|
    if ('0'..'9').include?(source[index])
      source[index] = source[index].to_i
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
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "I", "but", "have", "only", "pets", "want"]
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