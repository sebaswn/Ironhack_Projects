class Car
	def wheels
		wheels = 4
	end

	def noise
		noise = "vroom"
	end

end

class Bike
	def wheels
		wheels = 2
	end
	def noise
		noise = "clank"
	end

end

class Boat
	def wheels
		wheels = 0
	end
	def noise
		noise = "splash"
	end

end

class Plane
	def wheels
		wheels = 3
	end
	def noise
		noise = "VROOM"
	end
end

class Count

	def count_wheels(array)
		total = 0
		array.each do |vehicle|
			total = total + vehicle.wheels
		end
		puts total
	end
end

class Noise
	def make_noise(array)
		array.each do |vehicle|
			puts vehicle.noise
		end
	end
end


Count.new.count_wheels([Car.new, Boat.new, Bike.new, Plane.new])

Noise.new.make_noise([Car.new, Boat.new, Bike.new, Plane.new])


