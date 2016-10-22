Rails.application.routes.draw do


  #国際化方法纏めサイト
  #http://ruby-rails.hatenadiary.com/entry/20150226/1424937175
  #ルーティング説明ページ
  #http://railsguides.jp/routing.html

  #rootをわざと設定しない
  #trootを設定して、top_path使ったらurl⇒https://tabitomo-takeshitou.c9users.io/jaが正しい
  get '/(:locale)' => 'top#index', as: 'top'
  #rootを設定して、root_path使ったらurl⇒https://tabitomo-takeshitou.c9users.io/?locale=jaになってしまい
  #root 'top#index'

  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
   resources :user_reviews
  #  devise_for :members

      Rails.application.routes.draw do
        devise_for :members, controllers: {
          sessions: 'members/sessions'
      }
    end
  end


  #scope "(:locale)", locale: /ja/ do
  #  resources :books
  #end

  #scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
  #  resources :posts, param: :slug
  #end

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
