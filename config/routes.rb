Rails.application.routes.draw do
  get 'session/signup'
  post 'session/signin'
  delete 'session/signout'

  root 'welcome#index'
  ActiveAdmin.routes(self)

  resources :users, except: [:index] do
    resources :boards, except: [:index]
  end

  resources :pins do
    get 'search', on: :collection
  end
end
