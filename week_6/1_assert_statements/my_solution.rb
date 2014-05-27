# U2.W6: Testing Assert Statements

# I worked on this challenge [by myself].


# 2. Review the simple assert statement

# def assert
#   raise "Assertion failed!" unless yield
# end

# name = "bettysue"
# assert { name == "bettysue" }
# assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs
# Method assert is created with an exception error raised unless the block of code tested is true.
# Next the variable name is assigned "bettysue"
# First assert call includes the block of code to test which is true when yield is called, "So Assertion failed!" wont be triggered.
# Second assert call include the block of code to test which is false when yield is called, "So Assertion failed!" is triggered.

# 3. Copy your selected challenge here
class CreditCard
  attr_reader :card_number

  def initialize(card_number)
  	
    #Card number must be 16 digits long only
    if card_number.to_s.length != 16
      raise ArgumentError.new("Card number must be exactly 16 digits.")
    end
    #Take the card number, convert to a string, add to array using chars, and remap the strings in the array to integers. (&:to_i) is the short hand syntax of writing the block { |x| x.to_i }.   
    @card_number = card_number.to_s.chars.map(&:to_i)
  end
  
  def check_card
    @luhntotal = 0   #variable that holds to the total sum 
    @card_number.reverse! #reverse the array
    #iterate through the array 16 times
    @card_number.length.times do |index|
      if index % 2 != 0 #we want numbers in the odd index.
        @card_number[index] = @card_number[index] * 2 #double the number
      end
    end
    #iterate through the array again 
    @card_number.each do |value| 
      if value >= 10        
        @luhntotal += value - 9  #if double digit number, take the number subtract 9 from it to get the number to add up side by side.  (ex: 15 = 1 + 5 = 6, so 15-9 = 6)
      else
        @luhntotal += value   
      end
    end
    return @luhntotal % 10 == 0  #return true or false if total is divisible by 10.
  end
end

# 4. Convert your driver test code from that challenge into Assert Statements
def assert
  raise "Assertion failed!" unless yield
end

card1 = CreditCard.new(4563960122001999)
card2 = CreditCard.new(4408041234567892)
assert { card1.check_card  == true }
assert { card2.check_card  == false }
assert { card1.card_number.length == 16}

# 5. Reflection
=begin
	Looking at the example given in the challenge, I was able to translate my old driver test code to the assert statements.   I was hoping to be able to apply the assert statement if I created a new instance of CreditCard using 1 digit, but my ArgumentError override the assert statement.   I did start researching the Test::Unit::Assertion module, but I wasn't exactly sure how to use that yet.   I hope that what we did this challenge will lead to that module.   I did not find this challenge tedious in any way, I can see how building test scenerios are important to getting the code working properly.
=end
