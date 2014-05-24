# U2.W5: Bakery Challenge GPS

# I worked on this challenge with: 
# Your Names
# 1)Tony Leung
# 2)Tanner Blumer

# Our Refactored Solution
def bakery_num(num_of_people, fav_food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
  food_list = {"pie"=> 0,"cake"=> 0, "cookie" => 0}

    if my_list.has_key?(fav_food)
      if num_of_people % my_list[fav_food] == 0
          return "You need to make #{num_of_people / my_list[fav_food]} #{fav_food}(s)."
      else
        food_list[fav_food] = num_of_people / my_list[fav_food]
        num_of_people = num_of_people % my_list[fav_food]
        
        my_list.each do |k,v| 
            food_list[k] += num_of_people / v
            num_of_people = num_of_people % v
        end
        return "You need to make #{food_list['pie']} pie(s), #{food_list['cake']} cake(s), and #{food_list['cookie']} cookie(s)."
      end
    else
        raise ArgumentError.new("You can't make that food")  #Raise error if favorite food not found
    end
end

#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!

#  Reflection 
=begin
Going through the original code one line at a time was crucial in determining what we can get rid of vs what we can't.  I paired up with Tanner Blumer and he was great at dissecting the code and making sense of what is useless.   I was a little lost on what the while statement was doing in the original code since there was so many conditionals going on and the reassigning of num_of_people.   We we're able to take the code apart, think about what happens if we decide to add in more desserts and how it would make that while statement even worse.   Then we decided to use a secondary hash that mimics the first one and then assign the actual amount to desserts to make for each type and finally return the values in the new hash back to the caller.
=end


