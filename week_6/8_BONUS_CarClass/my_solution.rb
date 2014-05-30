# U2.W6: Create a Car Class from User Stories

# I worked on this challenge with Tony Leung / John Akers

# 2. Pseudocode

=begin

  As a video game player, I want to be able to create a new car and set it's model 
    and color so I can customize it in the video game.
    
  As a video game player, I need to be able to define a distance to drive so I can
    follow directions appropriately.
    
  As a video game player, I'd like to be able to see the speed I am traveling, so 
    I can properly accelerate or decelerate.
    
  As a video game player, I want to be able to turn left or right so I can navigate 
    a city and follow directions.
    
  As a video game player, I want to be able to accelerate and decelerate the car to 
    a defined speed so I can drive following the rules of the road.
    
  As a video game player, I want to keep track of the total distance I have travelled, 
    so I can get paid for mileage.
    
  As a video game player, I want to be able to stop the car so I can follow traffic signs
    and signals.
    
  As a video game player, I would like to see output reflecting the latest action of my 
    car so I can see a play-by-play of the pizza delivery.

# create a Car class
  # instance variables of "model" and "color" AND "speed" (which is set to 0 initially)
    # instance variable called "state", keeping track of the last thing we did
  # a method that take in an integer to define our distance
  # a method called "steer" that states which way to turn
  # a method called "gas pedal / set speed" to denoted acceleration / deceleration of speed
  # a method called "odometer / trip meter" to denote to mileage
  # a method called "stop" that sets speed to 0

=end

# 3. Initial Solution
# class Car
#   attr_reader :state, :speed
  
#   def initialize(model, color)
#     @model = model
#     @color = color
#     @state = ""
#     @speed = 0
#     @totalmiles = 0
#   end
  
#   def drive(miles, speed = @speed)
#     trip_meter(miles)
#     set_speed(speed)
#     @state = "forward"
#   end
  
#   def trip_meter(miles = 0)
#     @miles = miles
#     @totalmiles += @miles
#     puts "Total miles: #{@totalmiles}"
#     @totalmiles
#   end
  
#   def set_speed(speed)
#     @speed = speed
#   end
  
#   def stop
#     set_speed(0)
#     @state = "stop"
#   end
  
#   def steer(direction)
#     puts "Turning #{direction}"
#     @state = direction
#   end
  
#   def currentstate
#     puts "The current state is direction: #{@state}, speed: #{@speed}, total miles traveled: #{@totalmiles}"
#   end
  
# end


# 4. Refactored Solution
class Car
  attr_reader :state, :speed, :model, :color, :totalmiles, :pizza
  
  def initialize(model, color)
    @model = model
    @color = color
    @state = ""
    @speed = 0
    @totalmiles = 0
    @pizza = []
  end
  
  def drive(miles, speed = @speed)
    @totalmiles += miles
    set_speed(speed)
    @state = "forward"
  end
  
  def trip_meter
    puts "Total miles: #{@totalmiles}"
    @totalmiles
  end
  
  def set_speed(speed)
    @speed = speed
  end
  
  def stop
    set_speed(0)
    @state = "stopped"
  end
  
  def steer(direction)
    puts "Turning #{direction}"
    @state = direction
  end
  
  def currentstate
    puts "The current state is direction: #{@state}, speed: #{@speed}, total miles traveled: #{@totalmiles}"
  end

  def next_pizza
  	puts "Next Pizza to deliver is: #{@pizza[0].size} #{@pizza[0].type} #{@pizza[0].listoftopping} #{@pizza[0].sauce}"
  end

  def deliver_pizza
  	@delivery = @pizza.shift
  	puts "Delivered: Size:#{@delivery.size} Type:#{@delivery.type} Toppings:#{@delivery.listoftopping} Sauce: #{@delivery.sauce}"
  end

  def add_pizza(pizza)
  	@pizza << pizza
  end

  def list_pizza
  	puts "Current List of Pizzas in the car"
  	@pizza.each do |x| 
  		print "Size: #{x.size} "
  		print "Type: #{x.type} "
  		print "Toppings: #{x.listoftopping} "
  		print "Sauce: #{x.sauce}"
  		puts ""
  	end
  end
end

class Pizza
	attr_reader :size, :type, :listoftopping, :sauce
	def initialize(size, type)
		@size = size
		@type = type
		@listoftopping = []
		@sauce = ""
	end

	def addtopping(*topping)
		@listoftopping << topping
	end

	def addsauce(sauce)
		@sauce = sauce
	end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
#Meat Lover pizza
mypie1 = Pizza.new(10, "Meat Lover")
mypie1.addtopping("pepperoni", "mushroom", "sausage", "salami", "chicken")
mypie1.addsauce("tomato")

#Plain cheese
mypie2 = Pizza.new(18, "Plain Cheese")
mypie2.addtopping("Extra Cheese")
mypie2.addsauce("tomato")

#Veggie pie
mypie3 = Pizza.new(12, "Vegetarian")
mypie3.addtopping("mushroom", "bellpeppers", "onion", "kale", "olives")
mypie3.addsauce("pesto")

#BBQ Chix
mypie4 = Pizza.new(8, "BBQ Chicken")
mypie4.addtopping("chicken","green onion", "red onion", "bacon", "tomatoes")
mypie4.addsauce("bbq")

def assert
  raise "Assertion failed!" unless yield
end

# Create a new car of your desired model and type
pizza_car = Car.new("Subaru Outback", "Gray")
#Confirm Car object created correctly 
assert { pizza_car.color == "Gray" }
assert { pizza_car.model == "Subaru Outback"}

# Drive .25 miles (speed limit is 25 mph)  
p pizza_car.drive(0.25, 25)
#Check current speed, state, and total miles
assert { pizza_car.speed == 25 }
assert { pizza_car.state == "forward" }
assert { pizza_car.totalmiles == 0.25 }

# At the stop sign, turn right  
p pizza_car.steer("right")
#Check that car turned right
assert { pizza_car.state == "right" }

# Drive 1.5 miles (speed limit is 35 mph)
p pizza_car.drive(1.5, 35)
#Check current speed, state, and total miles
assert { pizza_car.speed == 35 }
assert { pizza_car.state == "forward" }
assert { pizza_car.totalmiles == 1.75 }

# At the school zone, check your speed  
p pizza_car.speed
#Check speed = 35
assert { pizza_car.speed == 35 }

# Slow down to speed limit 15 mph  
p pizza_car.set_speed(15)
#Check speed = 15
assert { pizza_car.speed == 15 }

# Drive .25 miles more miles  
p pizza_car.drive(0.25)  # no 2nd argument
#Check current speed, state, and total miles
assert { pizza_car.speed == 15 }
assert { pizza_car.state == "forward" }
assert { pizza_car.totalmiles == 2.0 }

# At the stop sign, turn left
p pizza_car.steer("left")
#Check that car turned right
assert { pizza_car.state == "left" }

# Drive 1.4 miles (speed limit is 35 mph)
p pizza_car.drive(1.4, 35)
#Check current speed, state, and total miles
assert { pizza_car.speed == 35 }
assert { pizza_car.state == "forward" }
assert { pizza_car.totalmiles == 3.4 }

# Stop at your destination  
p pizza_car.stop
#Check that car stopped
assert { pizza_car.state == "stopped"}

# Log your total distance travelled
pizza_car.trip_meter
#Check total miles travelled
assert { pizza_car.trip_meter == 3.4 }

#Display current state of the car
pizza_car.currentstate

puts "**************"
#Add pizza to car
pizza_car.add_pizza(mypie1)
pizza_car.add_pizza(mypie2)
pizza_car.add_pizza(mypie3)
pizza_car.add_pizza(mypie4)
#confirm I have 4 pizzas in the car
assert { pizza_car.pizza.length == 4 }

pizza_car.list_pizza
puts "**************"
pizza_car.next_pizza

#deliver the first pizza (FIFO)
pizza_car.deliver_pizza
#confirm I have 3 pizza now in the car
assert { pizza_car.pizza.length == 3 }

puts "**************"
pizza_car.list_pizza

# 5. Reflection 
=begin
	This was a great challenge.   We really took what we learned this week and put it all together.   I worked with John Akers on this and he was a fantastic pair to work with.   We broke down the user stories, wrote out the driver code so we have an idea what methods to create, Pseudocode the whole project and finally start writing the code.   At the end of the session, we didnt get a chance to work on release 3 and 4.  But I ended up adding that feature into the challenge.   I created a new Pizza class and created methods to add toppings and add sauce.   Then in the Car class, I added in 4 methods, add pizza, deliver pizza, list all the pizzas, and show the next pizza to deliver.   I didnt have much difficulty in this challenge.  Everything was straight forward and fun.   Nothing was tedious and it was extremely good practice to build these classes and integrate them together.
=end
