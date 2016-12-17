Rails.application.routes.draw do

  #国際化方法纏めサイト
  #http://ruby-rails.hatenadiary.com/entry/20150226/1424937175
  #ルーティング説明ページ
  #http://railsguides.jp/routing.html

  #rootをわざと設定しない
  #trootを設定して、top_path使ったらurl⇒https://tabitomo-takeshitou.c9users.io/jaが正しい
  # get '/(:locale)' => 'top#index', as: 'top', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/
  #rootを設定して、root_path使ったらurl⇒https://tabitomo-takeshitou.c9users.io/?locale=jaになってしまい
  #root 'top#index'



  #locale: /#{I18n.available_locales.map(&:to_s).join('|')
  #上記の書き方は、指定したパラメータに対するフィルター、定義したものだけマッチする、
  #それ以外は該当ルーティングマッチから外す
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
   get '/' => 'top#index', as: 'top'
   get 'guide_detail/schedule' => 'guide_detail#schedule'
   resources :user_reviews
   resources :guides
   resources :traveler_bookings
   resources :guide_bookings
   resources :search_guides, :only => [:index]
   resources :star_masters, :only => [:show]
   resources :member_pictures, :only => [:show]
   resources :guide_detail, :only => [:show]
   resources :messages, :only => [:new,:create,:destroy]
   resources :msg_sends, :only => [:index]
   resources :msg_accepts, :only => [:index]
   resources :licence_pictures, :only => [:show]
   resources :travelers

    # devise_for :members, :path => "top#index"


    devise_for :members, :controllers => {
     :registrations => 'members/registrations',
     :sessions => 'members/sessions'
    }

    devise_scope :member do
      get "sign_in", :to => "members/sessions#new"
      get "sign_out", :to => "members/sessions#destroy"
    end

    
  end

  # ルーティングエラーハンドリング
  get '*path', to: 'application#render_404'

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
