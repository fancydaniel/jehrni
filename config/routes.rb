Rails.application.routes.draw do

  get 'lists/index'

  get 'lists/show'

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'

  resources :feed, only: [:index]
  resources :list, only: [:index, :show]

end
