Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/sessions" => "sessions#create"
  
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"
  
  get "/posts" => "posts#index"
  post "/posts" => "posts#create"
  get "/posts/:id" => "posts#show"
  patch "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"

  get "/comments" => "comments#index"
  post "/comments" => "comments#create"
  get "/comments/:id" => "comments#show"
  patch "/comments/:id" => "comments#update"
  delete "/comments/:id" => "comments#destroy"

end
