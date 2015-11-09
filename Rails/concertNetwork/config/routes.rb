Rails.application.routes.draw do

  root "concert#root"
  get "/concerts/today" => "concert#indexToday"
  get "/concerts/month" => "concert#indexMonth"
  get "/concerts/all" => "concert#indexAll"
  get "/concerts/week" => "concert#indexWeek"
  get "/concerts/add" => "concert#add"
  get "/concerts/:project_id" => "concert#show"

end
