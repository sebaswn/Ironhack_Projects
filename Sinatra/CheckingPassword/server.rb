require "sinatra"
require "sinatra/reloader"

require_relative"./lib/login.rb"


enable(:sessions)

get "/" do
	session[:loggedin] ||= false
	erb(:root)
end

post "/checkinglogin" do
	user = params[:username]
	pass = params[:password]
	result = Checker.new(user, pass).check

	if result == true 
		session[:loggedin] = true
		session[:user] = user
		redirect "/profilepage"
	else
		redirect "/"
	end
end
	
get "/profilepage" do
	@current_user = session[:user]
	erb(:profilepage)
end

post "/logout" do
	session[:loggedin] = false
	session[:user] = ""
	redirect "/"
end
