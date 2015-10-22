require "pry"
class User
	attr_accessor :input_user
	attr_accessor :user
	def initialize(user, input_user)
		@user = user
		@input_user = input_user
	end

	def ask_user
		puts "What is the users: "
		@input_user = gets.chomp
	end
end

class Password
	attr_accessor :password
	attr_accessor :input_password
	def initialize(password, input_password)
		@password = password
		@input_password = input_password
	end

	#password = "password"
	def ask_password
		puts "What is the password: "
		@input_password = gets.chomp

	end
end


class Access
	def initialize(user, password)
		@user = user
		@password = password
	end

	def compare_input

		if @user.input_user == @user.user && @password.input_password == @password.password
			puts "Please enter your text: " 
			input_text = gets.chomp
		else
			puts "Your Username or Password is wrong."
		end
	end
end

class Count
	def initialize
		
	end
end




sebas = User.new("sebas", "")
password = Password.new("password", "")
text = Access.new(sebas, password)

sebas.ask_user
password.ask_password
text.compare_input

