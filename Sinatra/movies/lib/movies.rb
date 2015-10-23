class Movie
	attr_accessor :list_with_posters, :random

	def initialize
		@list = []
		@random = nil
	end

	def find_movie(key_word)
		@list = []
		@list = Imdb::Search.new(key_word)
		check_movie_posters
	end

	def check_movie_posters
		x = 0
		list_with_posters = []
		while x < 20 do
			i = Imdb::Movie.new(@list.movies[x].id).poster
			if i != nil
				list_with_posters << @list.movies[x]
			end
			x = x +1
		end
		list_with_posters
	end

	def generate_question
		@random = rand(5)
	end

	def check_answer(id, list)
		if list[@random].release_date == Imdb::Movie.new(id).release_date
			true
		else
			false
		end
	end
end
