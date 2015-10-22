class Room
	attr_accessor :name
	attr_accessor :object
	def initialize(name, description, exits, input)
		@input = input
		@name = name
		@description = description
		@exits = exits
	end

	def start
		@input.decision(@name, @description, @exits, @list_of_rooms)
	end
end


class Input 
	def initialize
        @rooms = []
        @position = 0
        @key = false
    end

    def add_room(room)
        @rooms.push(room)
    end

	def decision(name, description, exits,  game_world)
		puts "You are in the " + name + ". " + description + ". "

		if  exits[:O] == true

			puts "There is a key in this room. Would you like to pick up ? (Y/N)"
			pick_up = gets.chomp

			if pick_up == "Y"
				puts "you have picked up the key. I wonder what it's for..."
				exits["O"] = false
				@key = true
			elsif pick_up == "N"
				puts "you have not picked up the key. I don't think that was very wise..."
			end
		end
			puts "Where would you like to go?"
			print "Doors: "
			if exits[:N] != nil
				print "N "
			end
			if exits[:E] != nil
				print "E "
			end
			if exits[:S] != nil
				print "S "
			end
			if exits[:W] != nil
				print "W "
			end

			print ">"
			step = gets.chomp
			if step == "N" && exits[:N] != nil
				@position = exits[:N]
				move(@position)
			elsif step == "E" && exits[:E] != nil
				@position = exits[:E]
				move(@position)

			elsif step == "S" && exits[:S] != nil
				if @position != 3
					@position = exits[:S]
					move(@position)
				elsif @position == 3 && @key == false
					puts "This door is locked"
					move(@position)
				elsif @position == 3 && @key == true
					puts "You have unlocked the door !! You are now outside and free"
					exit
					@position = exits[:S]
					move(@position)
				end

			elsif step == "W" && exits[:W] != nil
				@position = exits[:W]
				move(@position)
			else 
				puts "There is no exit in  direction " + step + ". Please try again."
				@rooms[@position].start
			end
	end

	def move(switch)
		@rooms[switch].start
	end
end




input = Input.new

room0 = Room.new("Living Room", "There are 3 doors", {:N => 2,
													  :E => 3,
													  :S => nil,
													  :W => 1,
													  :O => false}, input)
room1 = Room.new("Storage Room", "There is a door", { :N => nil,
												   	  :E => 0,
													  :S => nil,
												 	  :W => nil,
												 	  :O => false},input)
room2 = Room.new("Play Room", "There are 2 doors", { :N => nil,
												   	    :E => 4,
													    :S => 0,
												 	    :W => nil,
												 	    :O => false},input)
room3 = Room.new("Entrance Room", "There are 2 doors", { :N => 4,
												   	     :E => nil,
													     :S => 7,
												 	     :W => 0,
												 	     :O => false},input)
room4 = Room.new("Library Room", "There are 3 doors", { :N => 5,
												   	    :E => nil,
													    :S => 3,
												 	    :W => 2,
												 	    :O => false},input)
room5 = Room.new("Main Bedroom", "There are 2 doors", { :N => nil,
												   	    :E => 6,
													    :S => 4,
												 	    :W => nil,
												 	    :O => false},input)
room6 = Room.new("Private Study", "There is a door", { :N => nil,
												   	   :E => nil,
													   :S => nil,
												 	   :W => 5,
												 	   :O => true},input)
room7 = Room.new("Outside", "Congratulations, you made it outside !", { :N => nil,
																		:E => nil,
																		:S => nil,
																		:W => nil,
																		:O => false},input)


list_of_rooms = [room0]

input.add_room(room0)
input.add_room(room1)
input.add_room(room2)
input.add_room(room3)
input.add_room(room4)
input.add_room(room5)
input.add_room(room6)
input.add_room(room7)

list_of_rooms[0].start

