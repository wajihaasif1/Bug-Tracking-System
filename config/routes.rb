Rails.application.routes.draw do
  
  resources :projects do
   member do
     put :add_user
   end
end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "projects#index"
end
