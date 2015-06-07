Rails.application.routes.draw do

  get 'lists/index'

  get 'lists/show'

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'

  resources :feeds, only: [:index]
  resources :lists, only: [:index, :show]

end
