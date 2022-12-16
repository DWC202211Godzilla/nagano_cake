Rails.application.routes.draw do

  namespace :public do
    get 'registrations/new'
    get 'registrations/create'
  end
  devise_for :customers, skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins, skip:[:registrations, :passwords] ,controllers:{
    sessions:"admin/sessions"
  }
  
  root to:"homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
