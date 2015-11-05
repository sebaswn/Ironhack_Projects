Rails.application.routes.draw do

  root to: "tweets#index"
  post "/tweets" => "tweets#create"


  resources :tweets, only: [:create]
end
