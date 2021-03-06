Rails.application.routes.draw do
  root 'welcome#home'

  get 'u/:id', to: 'user#show', as: 'user_show'
  resources :post, path: 'u/:user_id/submission/', except: [:create, :new, :index]

  resources :posts, to: 'post#create', only: [:create]
  get '/tasks/:task_id/submit', to: 'post#new', as: 'new_post'
  get '/explore', to: 'post#index', as: 'post_index'

  resources :tasks

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register',
    edit: 'u/:id/edit' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
