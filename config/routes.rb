Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  get "/home", to: "home#home"
  get "/about", to: "home#about"
  get "/register", to: 'users#new'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/about-site", to: "home#about-site"
  get "/courses/:id/submissions-admin", to: "courses#submissions", as: "user_course_submissions"
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :user_courses #, only: [:create, :update, :delete]

  resources :courses do
    resources :submissions, only: [:index]
    resources :announcements
    resources :lectures
    resources :assignments do
      resources :submissions, except: [:index]
    end
  end

  resources :forums do
    resources :posts do
      resources :responses
    end
  end

  resources :micro_blogs
  resources :contacts


  # From Aidan
  # resources :forums do
  #   resources :posts, only [:index, :new]
  # end

  # resources :posts, only [:show, :create, :delete, :update] do
  #   resources :replies, only [:index, :new]
  # end

  # resources :replies, only [:show, :create, :delete, :update]
end