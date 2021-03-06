Rails.application.routes.draw do

  post 'users/update'

  resources :payment_notifications

  resources :deliveries

  resources :orders do
    member do
      get :checkout
    end
    collection do
      get :thanks
      post :change_currency
    end
  end

  get 'orders/show'

  get 'orders/destroy'

  resources :line_items do
    member do
    delete :cancel
    post :put_back
    post :plus_one
      end
  end

  resources :products

  resources :variants do
    member do
      post :like
      delete :dislike
      post :change_color
      post :change_variant
    end
end


  resources :cart

=begin
  devise_for :users
=end
  devise_for :users, :controllers => {sessions: 'sessions'}

  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'products#index'

   get '*unmatched_route', :to => 'application#render_not_found'
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
