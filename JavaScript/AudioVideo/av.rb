require 'sinatra'
require 'sinatra/reloader'

enable :sessions

get '/av' do
  erb(:av)
end
