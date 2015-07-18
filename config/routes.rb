Rails.application.routes.draw do
 
  get 'notifications/index'

  get 'user_requests/index'

  get 'user_requests/create'

  get 'user_requests/new'

  get 'user_requests/destroy'

  get 'user_requests/show'

  get 'password_resets/new'

  get 'password_resets/edit'

 resources :users do
    member do
      get :following, :followers
    end
  end


 resources :users
 resources :sessions, :only => [:new,:create,:destroy]
 resources :account_activations, only:[:edit]
 resources :password_resets,     only: [:new, :create, :edit, :update]
 resources :microposts,          only: [:create, :destroy,:show]
 resources :towns,          only: [:index,:new,:destroy,:create]
 resources :user_requests,    only: [:index,:new,:destroy,:create]
 resources :relationships,       only: [:create, :destroy]

 root 'static_pages#home'

match 'users', to: 'users#index', via: :get
match 'signin', to: 'sessions#new', via: :get
match  'signout', to: 'sessions#destroy', via: :get
match  'signup', to: 'users#new', via: :get
match 'towns', to: 'towns#new', via: :get
match  'edit', to: 'users#edit', via: :get
match  'profile', to: 'users#show', via: :get
match  'home', to: 'static_pages#home', via: :get
match  'contact', to: 'static_pages#contact', via: :get
match 'what_to_know', to: 'static_pages#what_to_know', via: :get
match  'help', to: 'static_pages#help', via: :get
match  'about', to: 'static_pages#about', via: :get
match  'notifications', to:'notifications#index', via: :get
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
