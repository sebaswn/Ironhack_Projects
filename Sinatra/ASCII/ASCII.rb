require "sinatra"
require "sinatra/reloader"
require "ascii"


get "/ascii/:word" do
	@word = params[:word]
	@a = Artii::Base.new :font => 'slant'

	erb(:home)
end
