# U2.W4: Cipher Challenge

# I worked on this challenge with: John Akers.

# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
=begin

  ALL MY COMMENTS ARE TO THE RIGHT OF EACH LINE OF CODE.
  input = coded_message.downcase.split("") #this take the original string called coded_message, makes it all lower case and split each character into an array.
  decoded_sentence = [] #this is declaring an empty array called decoded_sentence
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c",   #Best daata structure would be an array since we know that the cipher is just shifting the four letters backwards.
            "h" => "d",   #A hash would work good here if the cipher has a random assignemnt
            "i" => "e",   #The best way to automate this is by setting up an array called cipher
            "j" => "f",   #example: cipher = ('a'..'z').to_a
            "k" => "g",   #Then take the cipher array and use it to move letters back 4 slots based on the character taken in from the input array.
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
  input.each do |x| # each is iterating through each character from the original string 
    found_match = false  # this is assigned false because it is used at the bottom of the code if the current character being compared doesnt match any of the conditions
                         # If found_match was true, it will do nothing and the current character wont get added to the final decoded_sentence
    cipher.each_key do |y| # #each_key is looking in the cipher hash for the key that matches the current character being compared (variable x)
      if x == y  # This is comparing if the current character taken from the input array matches with the hash key.  X is coming from the input.each iteration call
                 # y is coming from the cipher.each_key iteration call.  Both variables are string characters stored in an array.
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here?  The break takes you out of the cipher.each_key iteration call when it found a match.
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #This is comparing if any of this symbols match, pass a blank space to the decoded_sentence
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # This builds an array of integers from 0 to 9 and include? is comparing if the x value is a number between 0 to 9. If it is a number, return true.
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  # This just checks that if the current x value is not a match for any of the above comparison, then just pass itself to the decoded_sentence
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #This is trying to use regular expression to match up one or more digits 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...Yes....we take the number found and divide by 100 to chop off two zeros from the end such that 10000 =
  end
  return decoded_sentence # This is returning a string which is the final decoded sentence.   The decoded sentence array was joined up to become a string of all the characters together.
end
=end


=begin
#THIS IS THE ORIGINAL CODE
def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c", 
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  input.each do |x| # What is #each doing here?
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
    cipher.each_key do |y| # What is #each_key doing here?
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here?
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  # What is this looking for?
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
  end  
  return decoded_sentence # What is this returning?        
end
=end

# Your Refactored Solution
def north_korean_cipher(coded_message) 
  input = coded_message.downcase.split("") 
  decoded_sentence = []
  cipher = ('a'..'z').to_a
  input.each do |x| 
    if cipher.index(x) != nil
      decoded_sentence << cipher[cipher.index(x)-4]
    elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*"
      decoded_sentence << " "
    else
      decoded_sentence << x 
    end 
  end
  decoded_sentence = decoded_sentence.join("")
  if decoded_sentence.match(/\d+/) 
      decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 }
  end  
  return decoded_sentence
end

# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"
#Reflection