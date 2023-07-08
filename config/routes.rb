Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :returns, except: [:destroy]
  get 'logistics', to: 'pages#logistics'
  # Defines the root path route ("/")
  # root "articles#index"
# Redirects returnsworth.online to eleanor.returnsworth.online
get '/', to: redirect('https://eleanor.returnsworth.online', status: 301)
end
