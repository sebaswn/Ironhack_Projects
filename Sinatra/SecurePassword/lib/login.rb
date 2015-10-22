require 'pry'

class Checker
	def initialize(username, password)
		@username = username
		@password = password
		@logins = [{username: "sebas", password: "ironhack"}, 
				   {username: "bob", password: "password"}]
		@hello = false
	end
	def check
		@logins.each do |index|
			#binding.pry
			if @username == index[:username] && @password == index[:password]
				@hello = true
			end
		end
		@hello
	end
end
