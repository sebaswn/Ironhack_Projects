require "sinatra"
require "sinatra/reloader"
require "artii"

variable = 3

get "/ascii/:word/:font?" do
	@word = params[:word]
	@font = params[:font]
	@a = Artii::Base.new :font => @font

	erb(:home)
end
