D2shed::Application.routes.draw do	
  get "password_resets/new"

	get 'register' => 'users#new', :as => 'register'
	get 'login' => 'sessions#new', :as => 'login'
	get 'logout' => 'sessions#destroy', :as => 'logout' 
	
  resources :users, :path => '/' do
		resources :accounts
	end
	resources :sessions
	resources :password_resets
	
	root :to => 'users#index' 
	match '/:id' => 'users#show' 
end