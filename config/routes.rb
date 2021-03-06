Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/landing', to: "landing#index", as: 'landing_index'

  resources :categories do
    resources :quotes
  end

  authenticated :user do
    get '/dashboard', to: 'dashboard#index', as: :dashboard
    root to: "dashboard#index", as: :user_dashboard
  end

  unauthenticated :user do
    root to: "subscribers#new"
  end

  get '/add_recaptcha', to: 'user_steps#add_recaptcha'

  resources :subscribers
  resources :user_steps, except: [:update]
  patch '/user_steps', to: 'user_steps#update', as: 'update_user_steps'

  get 'subscribers/unsubscribe/:unsubscribe_hash' => 'subscribers#unsubscribe', :as => 'unsubscribe'

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
