Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/users", to: "users#index", as: "users" 
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:user_id/posts", to: "posts#index", as: "posts"
  get "/users/:user_id/posts/new", to: "posts#new", as: "newpost"
  post "/users/:user_id/posts", to: "posts#create"
  get "/users/:user_id/posts/:post_id", to: "posts#show", as:"post"
  get "/users/:user_id/posts/:post_id/comments/new", to: "comments#new", as:"comments"
  post "/users/:user_id/posts/:post_id/comments", to: "comments#create", as:"createcomments"
  post "/users/:user_id/posts/:post_id/like", to: "posts#like", as: "like_post"

end
