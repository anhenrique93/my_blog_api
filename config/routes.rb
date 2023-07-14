Rails.application.routes.draw do
  resources :post_categories
  resources :categories
  resources :posts do 
    # Categories
    delete 'categories/:category_id', to: 'posts#remove_category', as: 'remove_category'
    post 'categories/:category_id', to: 'posts#add_category', as: 'add_category'
    
    # Tags
    delete 'tags/:tag_id', to: 'posts#remove_tag', as: 'remove_tag'
    post 'tags/:tag_id', to: 'posts#add_tag', as: 'add_tag'
  
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  
end
