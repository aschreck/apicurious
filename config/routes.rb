Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "home#index"  
	get "auth/github/callback", to: "sessions#create"
	get "auth/github", as: :github_login
	delete '/logout', to: 'sessions#destroy'
	 resources :user, only: [:show]
	 resources :dashboard, only: [:index]
end
