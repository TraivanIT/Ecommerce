Rails.application.routes.draw do



  
  
  
  
  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy'
  namespace :admin do
    resources :customers, only: [:index , :show]
    resources :products
    resources :sessions, only: [:new, :create, :destroy]
    resources :moderators, only: [:index, :edit, :update]
  end
  
	root 'pages#home'	
  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  




  
  resources :customers

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'customers#new', as: 'signup'
  get 'loggin', to: 'sessions#new', as: 'loggin'
  get 'loggout', to: 'sessions#destroy', as: 'loggout'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
