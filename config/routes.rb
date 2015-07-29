Rails.application.routes.draw do


  get 'tags/:tag', to: 'items#index', as: :tag

  devise_for :users
  get 'lists/index'

  get 'lists/show'

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'

  resources :feeds
  resources :lists do
    resources :items
  end

  resources :entries, only: [:create, :edit, :destroy, :update]

end
