Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
  
  get 'about' => 'pages#about'
  # OR:
  # get 'about', to: 'pages#about'
  
  # resources will give me all RESTful routes for articles:
  resources :articles
  # to ONLY create specific routes you select from the list below:
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]

end
