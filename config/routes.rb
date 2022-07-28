Rails.application.routes.draw do
	root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
	get '/register', to: 'brankdays#new'
	post '/register', to: 'brankdays#create'
	get '/makegroup', to: 'groups#new'
	post '/makegroup', to: 'groups#create'
	get '/joingroup', to: 'belongs#new'
	post '/joingroup', to: 'belongs#create'
	resources :users
	resources :groups
end
