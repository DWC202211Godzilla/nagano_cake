Rails.application.routes.draw do
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
