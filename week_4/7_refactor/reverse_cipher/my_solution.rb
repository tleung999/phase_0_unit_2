# U2.W4: Refactor Cipher Solution


# I worked on this challenge [by myself].

# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)                       #declare a new method called translate_to_cipher passing in a string
    alphabet = ('a'..'z').to_a                          #create a new array called alphabet assigning array element with 1 character from a to z
    cipher = Hash[alphabet.zip(alphabet.rotate(4))]     #take alphabet array shift everything to the left 4 spaces, 
                                                        #then zip it together making an array of arrays with two elements,
                                                        #then each paired element will become a hash using key from the 
                                                        #original alphabet array and assigning a value from the rotate(4) alphabet array
                                                        #Lastly assigning the variable cipher to the hash
    spaces = ["@", "#", "$", "%", "^", "&", "*"]        #Create an array called space with the following symbols as elements in the array

    original_sentence = sentence.downcase               #lower case the original sentence
    encoded_sentence = []                               #create a new blank array called encoded_sentence
    original_sentence.each_char do |element|            #iterate through the whole sentence one character at a time
      if cipher.include?(element)                       #If the current character element matches a key in the cipher hash go inside if block
        encoded_sentence << cipher[element]             #Take the value saved in the cipher hash that matches the cipher key based on the element and add character to encoded_sentence variable
      elsif element == ' '                              #Else if the character element is a space, then enter this if block
        encoded_sentence << spaces.sample               #take a sample random element from the space array and pass it into the encoded_sentence variable
      else                                              #else if nothing matches
        encoded_sentence << elements                    #pass the original character element to the encoded_sentence variable
      end 
     end
    
    return encoded_sentence.join                        #now take all the character in the encoded_sentence array and join them all together as one string and return the string.
end

# Questions:
# 1. What is the .to_a method doing?
# The .to_a method is changing the range into an array element
# 2. How does the rotate method work? What does it work on?
# The rotate method takes the original array and rotate to the left or right based on the number you place in the argument.  So for example
# if you had [1,2,3,4,5,6].rotate(2) the array will output [3,4,5,6,1,2]
# 3. What is `each_char` doing?
# each_char takes a string and breaks it up into individual characters so you can iterate through the whole string.
# 4. What does `sample` do?
# Sample will randomly pick an element from the array you pass it.
# 5. Are there any other methods you want to understand better?
# Zip took me a bit to understand, but I finally got it.  It basically takes the array element from the original array and links it up
# with the other array such that array1[0] is linked up with array2[0].  
# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
# It looks pretty close to our refactored solution except we used arrays and shifted the array index back 4 spaces.    This code is compact
# clear, and gets to the point.   That cipher that was equal to those chained method took a bit to break down, but it wasnt too bad.
# 7. Is this good code? What makes it good? What makes it bad?
# I liked this code, I felt it was good and took advantage of many methods available.   It didnt have to keep track of variables set to 
# iterators.   The code is DRY and I dont see any repetition of code.

# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
# No the Driver test does not return the same thing every time because the spaces will use the sample method to randomly pick a symbol to use
# as a space.
# My output came out like this
# "m#aerx%gssomiw"
# "m^aerx$gssomiw"
# "m#aerx@gssomiw"
# "m$aerx#gssomiw"
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")

# 5. Reflection 
=begin
Breaking down the code one line at a time really helps to see what is going on.  IRB is super useful when you cant figure 
out what the line of code is doing.    I also found that if you have a line of code that has chained methods, you can use
order of operation and IRB each piece from the inside out to see what each piece returns and how the next method up on the chain
will take it in and return back.  One thing I noticed was that cipher.include?(element) could be replaced with cipher.has_key?(element)
Cool that there is more than one way to solve the problem.

Some of the new things i learned is using the sample, zip, and rotate method.   Now it'll be something I will consider while
writing my code.   I am fairly confident with this challenge and feel really comfortable explaining each line of code.

I enjoyed seeing new methods in action and code examples on how its implemented.   Nothing tedious with this challenge, it was
very simple code that did a lot of work.   
=end
