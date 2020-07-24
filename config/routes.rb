Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations", sessions: "users/sessions" }
  root "products#index"
  devise_scope :user do
    get "new_user", to: "users/registrations#new_user"
    post "new_user", to: "users/registrations#create_user"
  end
  devise_scope :user do
    get "addresses", to: "users/registrations#new_address"
    post "addresses", to: "users/registrations#create_address"
  end
  devise_scope :user do
    get "users/profile/:id", to: "users/sessions#show", as: "profile"
  end

  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :buyers, only: [:new, :create]
  end
  resources :categories, only: [:index, :show]

  resources :cards, only: [:new, :create, :show, :destroy]

end
