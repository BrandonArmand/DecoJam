Rails.application.routes.draw do

  get 'user/:id', to: 'user#show'

  devise_for :users
  root 'welcome#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
