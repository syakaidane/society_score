Rails.application.routes.draw do

  # 会員用
# URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  # 会員側のルーティング設定
  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    
    get "/customers/my_page" => "customers#show"
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/quit' => 'customers#quit'
    patch 'customers/withdraw' => 'customers#withdraw'
    
    resources :scores, only: [:index,:show]
    
    delete '/cart_scores' => 'cart_scores#destroy'
    resources :cart_scores do
      member do
        delete "destroy_all"
      end
    end
  
    resources :orders, only: [:new,:index,:show,:create]
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
    
    resources :favorites, only: [:create,:index,:destroy]
    resources :requests, only: [:new,:create,:index,:edit,:update,:destroy]
    
  end
  
  
  # 管理者側のルーティング設定
  namespace :admin do
  
  get "" => "scores#index"
  
  resources :scores, only: [:new,:create,:show,:edit,:update,:destroy]
  resources :genres, only: [:index,:create,:edit,:update,:destroy]
  resources :customers, only: [:index,:show,:edit,:update]
  resources :orders, only: [:index,:show,:update]
  resources :requests, only: [:index,:edit,:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end