Rails.application.routes.draw do

  get 'feeds/index'

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'


end
