require 'RSpec'

class FizzBuzz

	def fizz(number)

		if (number % 3 == 0) && (number % 5 == 0)
			"FizzBuzz"
		elsif number % 5 == 0
			"Buzz"
		elsif number % 3 == 0
			"Fizz"
		elsif !number.is_a?(Integer)
			"Not a number"
		else
			number
		end
	end
end

RSpec.describe "FizzBuzz" do
 	let (:fizzbuzz) {FizzBuzz.new}

	it "returns Fizz if number is divisible by 3" do 
		expect(fizzbuzz.fizz(6)).to eq("Fizz")
	end

	it "returns Buzz if number is divisible by 5" do 
		expect(fizzbuzz.fizz(10)).to eq("Buzz")
	end

	it "returns FizzBuzz if number is divisible both by 3 and 5" do
		expect(fizzbuzz.fizz(15)).to eq("FizzBuzz")
	end

	it "returns number if number is not divisible by 3 or 5" do
		expect(fizzbuzz.fizz(4)).to eq(4)
	end

	it "returns 'not a number' if value is not an integer" do
		expect(fizzbuzz.fizz("hello")).to eq("Not a number")
	end
end