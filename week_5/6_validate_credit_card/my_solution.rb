# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself, with: Gannon Curran].

# 2. Pseudocode

# Input: Create a new instance of the class passing in 1 argument which is an integer of 16 digits ONLY.  Can call the method check_card to validate the card is either true = good or false = bad.   
# Output: Should only output true or false after calling check_card method.
# Steps:
=begin
Create a new class called CreditCard
Initialize the class by passing in the card_number which is an integer of 16 digits.
Create a ArgumentError if card number is not equal to 16 digits.
Create an instance variable and dump each digit of the card number into an array of integers.
Create a method called check_card
Create a new instacne variable that will keep track of the total
Flip the array backwards
Find every odd indexed array point and double the number
Flip the array back to normal
Go through each number in the card number array and sum them together.
If the number is greater than or equal to 10, then subtract 9 from the number before adding it to the total.
Once you got the total, take the total and check to see if its divisible by 10.   If it is, then return true, else return false.
=end


# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
# class CreditCard
#   def initialize(card_number)
#     if card_number.to_s.length != 16
#       raise ArgumentError.new("Card number must be exactly 16 digits.")
#     end
#     @card_number = card_number.to_s.chars.map { |x| x.to_i }
#   end
  
#   def check_card
#     @luhntotal = 0
#     i = 0
#     @card_number.reverse!
#     @card_number.each do |a|
#       if i % 2 != 0
#         @card_number[i] = a * 2
#       end
#       i += 1
#     end
#     @card_number.reverse!
#     @card_number.each do |a|
#       if a >= 10
#         @luhntotal += a - 9
#       else
#         @luhntotal += a
#       end
#     end
#     return @luhntotal % 10 == 0
#   end
# end

# 4. Refactored Solution
class CreditCard
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

# 1. DRIVER TESTS GO BELOW THIS LINE
card1 = CreditCard.new(4563960122001999)
card2 = CreditCard.new(4408041234567892)
print "1: "; p card1.check_card  == true
print "2: "; p card2.check_card  == false

# 5. Reflection 
=begin
 I paired up with Gannon Curran tonight to work on this problem. We took our time in the beginning to break down the problem into managable chunks.   The challenge required us to do a lot of array manipulation to get everything right.   We ended up  calling the reverse, times, each, and map method.   Gannon also realize that in order for us to add a 2 digit number side by side, we simply just need to subtract 9 from the number.  That was a super elegant solution.  Before his recommendation, I almost decided to take the 2 digit number break up the number into 2 pieces, add them up, and then continue down the array. I really enjoyed pairing on this exercise.   I felt we both had a chance to show our stuff and really helped each other think through things.      
=end