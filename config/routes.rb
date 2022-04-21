Rails.application.routes.draw do
  devise_for :users
  root to: "memos#index"
  resources :memos do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    patch :toggle_status
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
