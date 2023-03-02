Rails.application.routes.draw do

  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'scores/new'
    get 'scores/index'
    get 'scores/show'
    get 'scores/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'requests/new'
    get 'requests/index'
    get 'requests/edit'
  end
  namespace :public do
    get 'favorites/index'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/complete'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/quit'
  end
  namespace :public do
    get 'cart_scores/index'
  end
  namespace :public do
    get 'scores/index'
    get 'scores/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # 顧客用
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
