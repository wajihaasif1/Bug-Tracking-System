Rails.application.routes.draw do
  root to: "projects#index"
  
  devise_for :users
  
  resources :projects do
   	 member do
     	put :add_user
     	delete :remove_user
  	 end
  	 resources :bugs do
  	 	member do
  	 		put :assign_dev
        put :started
        put :done
  	 	end
  	 end
  end


   

end
