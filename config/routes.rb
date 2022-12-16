Rails.application.routes.draw do

  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  devise_for :admins
  devise_for :customers


  devise_for :customers, skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins, skip:[:registrations, :passwords] ,controllers:{
    sessions:"admin/sessions"
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
