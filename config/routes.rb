Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations", omniauth_callbacks: "callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_for :users, :controllers => { registrations: "registrations" }

  root to: "posts#index"
  get "/users/:username", to: "users#profile", as: :profile
  get "/post/like/:post_id", to: "likes#save_like", as: :like_post
  post "/follow/account", to: "users#follow_account", as: :follow_account
  post "/unfollow/account", to: "users#unfollow_account", as: :unfollow_account
  post "/posts", to: "posts#create"
  get "/posts/:id/likes", to: "likes#list", as: :like_list
  get "/users/:id/follower", to: "followers#followers_list", as: :follower_list
  get "/users/:id/following", to: "followers#following_list", as: :following_list
  
  resources :users do
    resources :posts, only: [:show, :create, :new, :edit, :destroy, :update]
  end
  resources :posts, only: [:index]
  resources :comments, only: [:create, :destroy]
  resources :likes
  
  
end
