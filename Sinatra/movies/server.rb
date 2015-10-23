require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'imdb'

require_relative ('./lib/movies.rb')

movie = Movie.new

six_search_results = []

@find_posters = []

get "/" do
	redirect "/search"
end

get "/search"  do

	erb(:search)	
end

post "/searching_movie" do
	movie_search = params[:movie_to_search]

	hello = movie.find_movie(movie_search)
	six_search_results = hello[0..5]

	redirect "/movie_posters"
end

get "/movie_posters" do

	@random_number = movie.generate_question
	@find_posters = six_search_results
	erb(:posters)
end

post "/checking_answer" do
	movie_id = params[:id]

	
	if (movie.check_answer(movie_id, six_search_results)) == true
		redirect "/Correct"
	else
		redirect "/Incorrect"
	end
end


get "/Correct" do


	erb(:correct)
end

get "/Incorrect" do


	erb(:incorrect)
end

post "/trying_again" do
	redirect("/movie_posters")

end

post "/changing_title" do

	redirect("/")
end





















