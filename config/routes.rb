Rails.application.routes.draw do
  resources :networks
  resources :social_networks
  resources :profiles
  
  post '/auth/login', to: 'authentication#login'
  get '/auth/whoami', to: 'authentication#whoami'

  resources :post_categories
  resources :categories do
    get '/posts', to: 'categories#posts', as: 'posts'
  end

  resources :tags do
    get '/posts', to: 'tags#posts', as: 'posts'
  end
  
  resources :posts do
    # Categories
    delete 'categories/:category_id', to: 'posts#remove_category', as: 'remove_category'
    post 'categories/:category_id', to: 'posts#add_category', as: 'add_category'
    
    # Tags
    delete 'tags/:tag_id', to: 'posts#remove_tag', as: 'remove_tag'
    post 'tags/:tag_id', to: 'posts#add_tag', as: 'add_tag'

    # Last posts
    collection do
      get 'last/:posts_number', to: 'posts#last_posts', as: 'last_posts'
    end

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end