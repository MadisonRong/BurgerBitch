Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_for :users

  root 'welcome***REMOVED***index'

  resource :user do
    resources :orders
  end

  resource :restaurant do
    resources :dishes
  end

  namespace :admin do
    root 'welcome***REMOVED***index'
    resources :admins
    resources :orders do
      collection do
        get 'all'
      end
    end
  end

  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'

  ***REMOVED*** The priority is based upon order of creation: first created -> highest priority.
  ***REMOVED*** See how all your routes lay out with "rake routes".

  ***REMOVED*** You can have the root of your site routed with "root"
  ***REMOVED*** root 'welcome***REMOVED***index'

  ***REMOVED*** Example of regular route:
  ***REMOVED***   get 'products/:id' => 'catalog***REMOVED***view'

  ***REMOVED*** Example of named route that can be invoked with purchase_url(id: product.id)
  ***REMOVED***   get 'products/:id/purchase' => 'catalog***REMOVED***purchase', as: :purchase

  ***REMOVED*** Example resource route (maps HTTP verbs to controller actions automatically):
  ***REMOVED***   resources :products

  ***REMOVED*** Example resource route with options:
  ***REMOVED***   resources :products do
  ***REMOVED***     member do
  ***REMOVED***       get 'short'
  ***REMOVED***       post 'toggle'
  ***REMOVED***     end
  ***REMOVED***
  ***REMOVED***     collection do
  ***REMOVED***       get 'sold'
  ***REMOVED***     end
  ***REMOVED***   end

  ***REMOVED*** Example resource route with sub-resources:
  ***REMOVED***   resources :products do
  ***REMOVED***     resources :comments, :sales
  ***REMOVED***     resource :seller
  ***REMOVED***   end

  ***REMOVED*** Example resource route with more complex sub-resources:
  ***REMOVED***   resources :products do
  ***REMOVED***     resources :comments
  ***REMOVED***     resources :sales do
  ***REMOVED***       get 'recent', on: :collection
  ***REMOVED***     end
  ***REMOVED***   end

  ***REMOVED*** Example resource route with concerns:
  ***REMOVED***   concern :toggleable do
  ***REMOVED***     post 'toggle'
  ***REMOVED***   end
  ***REMOVED***   resources :posts, concerns: :toggleable
  ***REMOVED***   resources :photos, concerns: :toggleable

  ***REMOVED*** Example resource route within a namespace:
  ***REMOVED***   namespace :admin do
  ***REMOVED***     ***REMOVED*** Directs /admin/products/* to Admin::ProductsController
  ***REMOVED***     ***REMOVED*** (app/controllers/admin/products_controller.rb)
  ***REMOVED***     resources :products
  ***REMOVED***   end
end
