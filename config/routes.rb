Rails.application.routes.draw do
  root to: "projects#index"
  devise_for :users
  
  resources :projects do
   	 member do
     	put :add_user
  	 end
  end

  resources :bugs 
   

end
