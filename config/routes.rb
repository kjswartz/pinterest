Rails.application.routes.draw do
  root 'welcome#index'
  ActiveAdmin.routes(self)

  resources :users do
    resources :boards
  end

  resources :pins do
    get 'search', on: :collection
  end
end
