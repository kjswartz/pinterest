Rails.application.routes.draw do
  root 'welcome#index'
  ActiveAdmin.routes(self)

  resources :users, except: [:index] do
    resources :boards, except: [:index]
  end

  resources :pins do
    get 'search', on: :collection
  end
end
