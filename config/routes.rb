Rails.application.routes.draw do
  # Home
  get 'home', to: 'posts#home'
  # Root
  root 'posts#home'

  # Admin
  scope 'admin' do
    # Admin/Users
    resources :users do
      member do
        get 'change_password', to: 'users#edit_change_password', as: 'edit_change_password'
        patch 'change_password', to: 'users#change_password', as: 'change_password'
      end
    end
    # Admin/Posts
    resources :posts, except: [:show] do
      member do
        delete :delete_image_attachment
      end
      # Admin/Posts/PostAttributes
      resources :post_attributes, except: [:show]
    end
    # Admin/Categories
    resources :categories, except: [:show]
    # Admin/Messages
    resources :messages do
      collection do
        #Admin/Messages/Inbox
        get :inbox
      end
    end
  end

  # Posts
  resources :posts, only: [:show], as: 'rmpost' do
    collection do
      match 'search' => 'posts#search', via: [:get, :post], as: :search
    end
  end
  # get 'p/:id', to: 'posts#visit_post', as: 'visit_post'
  
  # Categories
  resources :categories, only: [:show], as: 'show_category'
  # get 'c/:id', to: 'categories#show', as: 'show_category'

  # Sessions
  get 'admin', to: 'sessions#new'
  post 'admin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
