Rails.application.routes.draw do

  namespace :admin do
    resources :customeres, only: [:index, :edit, :show, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    get '/' => 'homes#top'
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:update, :show]
  end

  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    get 'orders/new'
    post 'orders/create'
    get 'orders/thanks'
    post 'orders/confirm'
    get 'orders/index'
    get 'orders/show'
    get 'cart_items/index'
    patch 'cart_items/update'
    delete 'cart_items/destroy'
    delete 'cart_items/destroy_all'
    post 'cart_items/create'
    get 'customers/show'
    get 'customers/edit'
    patch 'customers/update'
    get 'customers/unsubscribe'
    patch 'customers/withdrawal'
    get root to: 'homes#top'
    get '/about'=>'homes#top'
  end

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
