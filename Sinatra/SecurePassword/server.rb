require "sinatra"
require "sinatra/reloader"

require_relative"./lib/password.rb"

enable(:sessions)

get "/" do
	session[:loggedin] ||= false

	erb(:root)
end 

post "/checkingpassword" do
	email = params[:email]
	pass = params[:password]
	login_info = PasswordChecker.new(email, pass)

	if login_info.length? == true && login_info.number? != nil && login_info.small_letters? != nil && login_info.big_letters? != nil && login_info.symbols? != nil && login_info.email? == false
		session[:loggedin] = true
		session[:email] = email
		redirect "/profilepage"
	else
		redirect "/"
	end
end
	
get "/profilepage" do
	@current_user = session[:email]
	erb(:profilepage)
end

post "/logout" do
	session[:loggedin] = false
	session[:user] = ""
	redirect "/"
end
