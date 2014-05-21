# U2.W5: Virus Predictor

# I worked on this challenge [by myself.

=begin
# EXPLANATION OF require_relative
  Require and require_relative allows you to load a file into your current ruby code in order to add additional functionality or data.   The difference between the two is that require adds in the included libraries in the original ruby framework path while require_relative allows you to import your libraries from the location relative to the file you're using. So for example, if your rb file is located at /Users/me/Desktop and the file you want to include (myrequiredfile.rb) is located in /Users/me/Desktop/myrubylib.  Then you can use require_relative 'myrubylib/myrequiredfile.rb' to add it to your ruby file.   
#Analyze state_data
state_data is a large hash containing the state name as the key and a hash within it that contains the keys population density, population, region, and regional_spread.   These keys are symbols which you can separate from the value stored by iterating through the inner hash or you can access it using STATE_DATA[Key(statename)][:symbolname].  Example would be STATE_DATA["Alabama"][:population_density] to get the value 94.65.

#EXPLANATION of private
Private makes any method below the private line inaccessible to the caller.   predicted_deaths and speed_of_spread are methods where you cant call, such as using newclass.predicted_deaths or newclass.speed_of_spread.   virus_effects is the only method available to the caller which calls the private methods to use internally.

#Original Code
require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  def virus_effects  #HINT: What is the SCOPE of instance variables?
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
  end

  private  #what is this?  what happens if it were cut and pasted above the virus_effects method

  def predicted_deaths(population_density, population, state)
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else 
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  def speed_of_spread(population_density, state) #in months
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else 
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end
=end

#REFACTORED VERSION
require_relative 'state_data' #include the state_data file that contains the hash list.   the state_data file exist in the same location as this file.

class VirusPredictor

  def initialize(state_of_origin, population_density, population) #When instance is created, create the following instance variables.   I removed the @region and @next_region variables since they are not even used.
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  def allstates
    STATE_DATA.each do |key, value|
      @state = key
      @population = value[:population]
      @population_density = value[:population_density]
      #allstates = VirusPredictor.new(key, value[:population_density], value[:population])
      virus_effects
    end
  end


  def virus_effects  #HINT: What is the SCOPE of instance variables?  The scope of the instance variables is within the instance of the class.   So after I create a new instance of this class, the variable are available to the instance of the class and can be called from anywhere within the instance of the class.  I removed all the arguments.
    #predicted_deaths()
    deathandspeed()
  end

  private  #what is this? Private makes any method below this line inaccessible to the caller.   predicted_deaths and speed_of_spread are methods where you cant call, such as using newclass.predicted_deaths or newclass.speed_of_spread.   virus_effects is the only method available to the caller which calls the private methods to use internally.

  def deathandspeed #I refactored speed_of_spread and predicted_death into one method called deathandspeed.   It was silly to see two methods tht had the same range of comparisons.   I also used a case statement instead of a bunch of if/elsif.   

    case @population_density.floor
    when 0..49
      number_of_deaths = (@population * 0.05).floor
      speed = 2.5
    when 50..99
      number_of_deaths = (@population * 0.1).floor
      speed = 2.0
    when 100..149
      number_of_deaths = (@population * 0.2).floor
      speed = 1.5
    when 150..199
      number_of_deaths = (@population * 0.3).floor
      speed = 1.0
    else
      number_of_deaths = (@population * 0.4).floor
      speed = 0.5
    end
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================
# This is the code to display all 50 states outside of the class.
# STATE_DATA.each do |key, value|
#   allstates = VirusPredictor.new(key, value[:population_density], value[:population])
#   allstates.virus_effects
# end

# DRIVER CODE
 # initialize VirusPredictor for each state
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population]) 
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population]) 
alaska.virus_effects

#using the last instance alaska, call allstates method to display all states.
puts "*********************DISPLAY ALL STATES*****************************"
alaska.allstates