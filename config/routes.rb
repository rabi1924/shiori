Rails.application.routes.draw do
  devise_for :users
  root to: "memos#index"
  resources :memos do
    resources :comments
  end
  resources :users, only: :show
end
