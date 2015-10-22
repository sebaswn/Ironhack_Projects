require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative('./lib/calculator.rb')

calc = Calculator.new

get "/" do

	erb(:root)
end
############################################
get "/add" do

	erb(:add)
end
post "/calculate_add" do
	first = params[:first_number].to_f
	second = params[:second_number].to_f
	"#{total = calc.add(first, second)}"
end
############################################
get "/subtract" do

	erb(:sub)
end
post "/calculate_sub" do
	first = params[:first_number].to_f
	second = params[:second_number].to_f
	"#{total = calc.sub(first, second)}"
end
############################################
get "/divide" do

	erb(:div)
end
post "/calculate_div" do
	first = params[:first_number].to_f
	second = params[:second_number].to_f
	"#{total = calc.divide(first, second)}"
end
############################################












