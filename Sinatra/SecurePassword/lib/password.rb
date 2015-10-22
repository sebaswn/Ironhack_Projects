require 'RSpec'
require 'pry'

class PasswordChecker
	def initialize(email, password)
		@email = email
		@password = password
	end

	def length?
		@password.length >= 7
	end

	def number?
		@password =~ /\d/
	end

	def small_letters?
		@password =~ /[a-z]/
	end

	def big_letters?
		@password =~ /[A-Z]/
	end

	def symbols?
		@password =~ /\W/
	end

	def email?
		parts = @email.split(/[@, "."]/)
		#binding.pry
		@password.include? (parts.to_s)
	end
end

RSpec.describe "Password" do
	before :all do
		@password = PasswordChecker.new("sebastiannee@yahoo.com", "Ir0nhack#")
	end

	it "checks to see the the password is at least 7 character long" do 
		expect(@password.length?).to eq(true)
	end

	it "checks that the password contains at least 1 number" do
		expect(@password.number?).not_to eq(nil)
	end	

	it "checks that the password contains at least 1 miniscule letter" do
		expect(@password.small_letters?).not_to eql(nil)
	end	

	it "checks that the password contains at least 1 capital letter" do
		expect(@password.big_letters?).not_to eql(nil)
	end

	it "checks that the password contains at least 1 capital symbol" do
		expect(@password.symbols?).not_to eql(nil)
	end

	it "checks that the password does not contain parts of email" do
		expect(@password.email?).to eq(false)

	end
end

