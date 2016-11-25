Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registrations => 'user_registrations'}
  
  resources :users 
  resources :products do
    resources :comments
  end

  resources :orders, only: [:index, :show, :create, :destroy]

  resources :payments
  
  mount ActionCable.server => '/cable'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  root 'static_pages#landing_page'

  post 'static_pages/thank_you'

  get 'orders/index'

  get 'users/new'

  get 'products/new'

  get '/products/:id/edit' => 'products#edit'

  post 'payments/create'

  get 'comments/edit'

  #get 'products/:id' => 'products#show'#

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
