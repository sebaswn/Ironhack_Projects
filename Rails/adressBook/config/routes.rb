Rails.application.routes.draw do

  get "/" => "contacts#index"

  get "/new" => "contacts#new"

  get "/contacts/show" => "contacts#show"

  post("/contacts", :to => "contacts#create")


end
