class Car
	# will keep track of total cars created
	@@total_car_count = 0

	# will keep track of the number of cars per color
	@@cars_per_color = Hash.new(0)

	# returns total cars created
	def self.total_car_count
        @@total_car_count
    	end

    	# returns the count of cars created by color
    	def self.cars_per_color
    		@@cars_per_color
    	end

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color = "white")
		@fuel = 10
		@distance = 0
		@@total_car_count += 1
		@@cars_per_color[@color] += 1
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end

	# change the color of the color. Increment and decrement the class variable
	# @@cars_per_color as appropriate
	def color(new_color)
		@@cars_per_color[@color] -= 1
		@@cars_per_color[new_color] += 1
		@color = new_color
	end

	# returns the current most popular color
	def most_popular_color
		most_popular = @@cars_per_color.max_by {|k, v| v}
		# most_popular = ""
		# max = 0

		# @@cars_per_color.each do |k, v|
		# 	if v > max
		# 		max = v
		# 		most_popular = k
		# 	end
		# end
		# most_popular
		most_popular[0]
	end
end

# subclass of Car, a convertible
class ConvertibleCar < Car
	attr_accessor :roof_status

	def initialize(color = "white")
		super(color) # color of car, defaults to white
		@roof_status = "up" # keep track of whether the top is down or not, defaults to up
	end

	# open the roof
	def top_down
		@roof_status = "down"
	end

	# close the roof
	def close_top
		@roof_status = "up"
	end
end

car_a = Car.new("red")
car_b = Car.new
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b

puts Car.total_car_count
c1 = Car.new("red")
puts Car.total_car_count
c2 = Car.new("silver")
puts Car.total_car_count

# 1 - Class method on instance
# c = Car.new
# c.total_car_count

# 2 - Class method on class
Car.total_car_count

# 3 - Instance method on class
# Car.drive(10)

# 4 - Instance method on instance
c = Car.new
c.drive(10)

p Car.cars_per_color

c1.color("green")
p Car.cars_per_color

p c1.most_popular_color

c3 = ConvertibleCar.new("blue")
p c3
p Car.cars_per_color
p c3.most_popular_color
c3.top_down
puts c3.roof_status
c3.close_top
puts c3.roof_status
