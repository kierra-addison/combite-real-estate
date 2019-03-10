Rails.application.routes.draw do
  root 'posts#home'

  # Users
  resources :users

  # Posts
  resources :posts do
    member do
      delete :delete_image_attachment
    end

    collection do
      match 'search' => 'posts#search', via: [:get, :post], as: :search
    end

    resources :post_attributes, except: [:show]
  end

  get 'home', to: 'posts#home'
  get 'post-page/:id', to: 'posts#visit_post', as: 'visit_post'
  
  # Categories
  resources :categories

  # Sessions
  get 'admin', to: 'sessions#new'
  post 'admin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
