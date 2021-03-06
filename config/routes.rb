Runnery::Application.routes.draw do

 resources :users
 resources :sessions, only: [:new, :create, :destroy]
 resources :orders, only: [:create,:destroy,:update]
 resources :locations, only: [:create,:destroy,:update]

 root 'static_pages#home'

 match '/running',  to: 'users#running',  via: 'get'
 match '/done',  to: 'users#done_today',  via: 'get'
 match '/all_done',  to: 'users#all_done',  via: 'get'
 match '/signup',  to: 'users#new',  via: 'get'
 match '/signin',  to: 'sessions#new',         via: 'get'
 match '/signout', to: 'sessions#destroy',     via: 'delete'
 match '/site_info', to: 'static_pages#site_info', via: 'get'
 match '/dropoffs_wait', to: 'static_pages#dropoffs_wait', via: 'get'
 match '/pickups_wait', to: 'static_pages#pickups_wait', via: 'get'
 match '/dropoffs',  to: 'users#dropoffs',  via: 'get'
 match '/pickups',  to: 'users#pickups',  via: 'get'
 match '/dropoffs_done',  to: 'users#dropoffs_done',  via: 'get'
 match '/pickups_done',  to: 'users#pickups_done',  via: 'get'

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
