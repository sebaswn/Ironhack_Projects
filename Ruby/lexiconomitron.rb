require 'pry'

class Lexiconomitron
	def eat_t(string)
		string.gsub!("t", "")
		string.gsub!("T", "")
		string
	end
	def shazam(array)
		new_array = []
		array.each do |x|
			eat_t(x)
			x.reverse!
			new_array << x
		end
	end
	def oompa(array)
		new_array = []
		array.each do |x|
			eat_t(x)
			new_array << x
		end
		new_array.select { |x| x.length <= 3}
	end
end

RSpec.describe "Lexiconomitron" do
	describe Lexiconomitron do 
	  describe "#eat_t" do
	  	let (:lexi) {Lexiconomitron.new}
	    	it "removes every letter t from the input" do
	    	  expect(lexi.eat_t("great scott!")).to eq("grea sco!")
	    	end
	    	it "reverses the letters order of strings within an erray" do
	    		expect(lexi.shazam(["test", "to"])).to match_array(["se", "o"])
	    	end
	    	it "filters three or less letters words and shows them in an array" do 
	    		expect(lexi.oompa(["tod", "Tedd", "jo"])).to match_array(["od", "edd", "jo"])
	    	end
	  	end
	end
end