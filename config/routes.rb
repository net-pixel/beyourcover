Rails.application.routes.draw do
  get 'pages/about'
  devise_for :users, controllers: {
    registrations: "users/registrations", sessions: "users/sessions", confirmations: "users/confirmations" }
  root "products#index"
  devise_scope :user do
    get "new_user", to: "users/registrations#new_user"
    post "new_user", to: "users/registrations#create_user"
    get "addresses", to: "users/registrations#new_address"
    post "addresses", to: "users/registrations#create_address"
    get "edit_addresses", to: "users/registrations#edit_address"
    patch "edit_addresses", to: "users/registrations#update_address"
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
  end

  resources :categories, only: [:index, :show]

  resources :cards, only: [:new, :create, :show, :destroy]

  resources :carts, only: [:show, :destroy] do
    collection do
      post 'add_product'
    end
  end

  resources :orders, only: [:new, :create, :index] do
    collection do
      get 'confirm'
    end
  end 

  resources :order_details, only: :index

  resources :cart_details

  get 'about', to: 'pages#about'
  get 'privacy', to: 'pages#privacy'
  # get 'faq', to: 'pages#faq'
  get 'delivery', to: 'pages#delivery'
  get 'refund', to: 'pages#refund'
  get 'terms_of_service', to: 'pages#terms_of_service'
  get 'tokushoho', to: 'pages#tokushoho'
  get 'inquiry', to: 'pages#inquiry'
  get 'search', to: 'pages#search'
  get 'search_result', to: 'pages#search_result'

end
