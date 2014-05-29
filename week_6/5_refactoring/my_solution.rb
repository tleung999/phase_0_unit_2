# U2.W6: Refactoring for Code Readability


# I worked on this challenge [by myself].


# Original Solution
# class CreditCard
#   def initialize(card_number)
#     #Card number must be 16 digits long only
#     if card_number.to_s.length != 16
#       raise ArgumentError.new("Card number must be exactly 16 digits.")
#     end
#     #Take the card number, convert to a string, add to array using chars, and remap the strings in the array to integers. (&:to_i) is the short hand syntax of writing the block { |x| x.to_i }.   
#     @card_number = card_number.to_s.chars.map(&:to_i)
#   end
  
#   def check_card
#     @luhntotal = 0   #variable that holds to the total sum 
#     @card_number.reverse! #reverse the array
#     #iterate through the array 16 times
#     @card_number.length.times do |index|
#       if index % 2 != 0 #we want numbers in the odd index.
#         @card_number[index] = @card_number[index] * 2 #double the number
#       end
#     end
#     #iterate through the array again 
#     @card_number.each do |value| 
#       if value >= 10        
#         @luhntotal += value - 9  #if double digit number, take the number subtract 9 from it to get the number to add up side by side.  (ex: 15 = 1 + 5 = 6, so 15-9 = 6)
#       else
#         @luhntotal += value   
#       end
#     end
#     return @luhntotal % 10 == 0  #return true or false if total is divisible by 10.
#   end
# end

#NEW PSEUDOCODE
=begin
  Create a class called CreditCard
  Initialize the class taking in 1 arguement that is a string of 16 digits
    Check to make sure the card is 16 digits else throw and error message
    Convert the 16 digit string of numbers into an array of integers and assign it to the instance variable @card_number
  Create a method called check_card that will call the method double_even
    Next assign the instance variable @luhntotal equal to the value returned from the method sum_single_digits

  Declare private to hide the following methods from the caller.
  Create a method called double_even
    Iterate 16 times and double the integer value of the current number if the index of the array slot is even.
  Create a method called sum_single_digits
    Take the @card_number array, join all the values of the array together to form a string of numbers. Then break it up into individual string characters again using an array.
    Take @card_number array and remap it back to all integers.
    Take @card_number array and add up the total, return to caller.
=end

# Refactored Solution
class CreditCard
  def initialize(card_number)
    if card_number.to_s.length != 16
      raise ArgumentError.new("Card number must be exactly 16 digits.")
    end
    @card_number = card_number.to_s.chars
    @card_number = @card_number.map(&:to_i)
  end

  def check_card
    double_even
    @luhntotal = sum_single_digits
    return @luhntotal % 10 == 0 
  end

  private
  def double_even
    @card_number.length.times do |index|
      if index.even? == true
        @card_number[index] = @card_number[index] * 2
      end
    end
  end

  def sum_single_digits
		@card_number = @card_number.join("").chars
  	@card_number = @card_number.map(&:to_i)
  	@card_number.inject(:+)
  end
end

# DRIVER TESTS GO BELOW THIS LINE
card1 = CreditCard.new(4563960122001999)
card2 = CreditCard.new(4408041234567892)

def assert
  raise "Assertion failed!" unless yield
end

#Check a valid card
assert { card1.check_card == true }

#Check an invalid card
assert { card2.check_card == false }

# Reflection 
=begin
  This refactoring challenge was really interesting.   I had to battle myself internally on whether I should chain the methods together or not.   To me it felt ok since I understood what I was doing.   But I decided to take an outside person's view and broke up the code into multiple chunks.   The max method chain I created only chained 2 methods at once.    I believe this would make it easier for an outside person to read and understand.    I also broke up my original check_card method into 2 additional smaller methods.   The smaller methods were hidden from the caller using private.   My check_card method really just calls on the 2 smaller methods, take the return value from one of the methods and just check whether the sum was divisible by 10.   I am confident about the learning competencies, the challenge was a lot of fun and it wasn't tedious.
=end