Rails.application.routes.draw do

  get "/" => "sites#home"
  get "/contact" => "sites#contact"
 

  # post "/projects" => "projects#create"
  # get "/projects" => "projects#index"
  # get "/projects/new" => "projects#new"
  # get "/projects/:id" => "projects#show"
  # get "/projects/:project_id/entries" => "entries#index"
  # get "/projects/:project_id/entries/new" => "entries#new"
  # post "/projects/:project_id/entries" => "entries#create", as: "project_entries"

  resources :projects, only: [:index, :new, :show, :create] do
  	resources :entries, only: [:index, :new, :show, :create]
  end

  resources :entries, only: [:edit, :update, :destroy]

end
