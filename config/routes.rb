Rails.application.routes.draw do
  root 'posts#index'

  # Users
  resources :users

  # Posts
  resources :posts do
    member do
      delete :delete_image_attachment
    end

    resources :post_attributes, only: [:new, :create, :edit, :update, :destroy]
  end

  get 'admin', to: 'sessions#new'
  post 'admin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
