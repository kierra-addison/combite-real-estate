Rails.application.routes.draw do
  root 'posts#home'

  # Users
  resources :users
  get 'users/:id/change-password', to: 'users#edit_change_password', as: 'edit_change_password'
  patch 'users/:id/change-password', to: 'users#update_change_password', as: 'update_change_password'

  # Posts
  resources :posts, except: [:show] do
    member do
      delete :delete_image_attachment
    end

    collection do
      match 'search' => 'posts#search', via: [:get, :post], as: :search
    end

    resources :post_attributes, except: [:show]
  end

  get 'home', to: 'posts#home'
  get 'p/:id', to: 'posts#visit_post', as: 'visit_post'
  
  # Categories
  resources :categories

  # Sessions
  get 'admin', to: 'sessions#new'
  post 'admin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
