Rails.application.routes.draw do

  namespace :public do
    get 'registrations/new'
    get 'registrations/create'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end



  devise_for :customers, skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions: 'public/sessions'
  }


  devise_for :admin, skip:[:registrations, :passwords] ,controllers:{
    sessions:"admin/sessions"
  }

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'admin'=> 'admin/homes#top'
  get 'search' => 'searches#search'


  scope module: :public do
    resources :items, only:[:index, :show]

    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdrawal'

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items,only:[:index, :update, :destroy, :create]

    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only:[:new,:create, :index, :show]

    resources :addresses, only:[:index,:edit,:create,:update,:destroy]

  end

  namespace :admin do
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
