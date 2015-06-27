Rails.application.routes.draw do

  devise_for :users
  get 'lists/index'

  get 'lists/show'

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'

  resources :feeds
  resources :lists

end
