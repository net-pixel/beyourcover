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

end
