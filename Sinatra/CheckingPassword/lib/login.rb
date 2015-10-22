require 'pry'

class Checker
	def initialize(username, password)
		@username = username
		@password = password
		@logins = [{username: "sebas", password: "ironhack"}, 
				       {username: "bob", password: "password"}]
		@validated_password = false
	end
	def check
		@logins.each do |index|
			#binding.pry
			if @username == index[:username] && @password == index[:password]
				@validated_password = true
			end
		end
		@validated_password
	end
end