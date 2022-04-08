Rails.application.routes.draw do
  devise_for :users
  root to: "memos#index"
  resources :memos do
    resources :comments
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
