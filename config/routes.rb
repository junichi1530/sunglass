Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] # ユーザーマイページへのルーティング
  get 'rizins/:rizin_id/likes' => 'likes#create'
  get 'rizins/:rizin_id/likes/:id' => 'likes#destroy'
  resources :rizins do

    resources :likes, only: [:create, :destroy]
  end
  resources :perfumes
  # /rizins へのGETリクエストに対応するルートを追加
  get '/rizins', to: 'rizins#new'
  root 'rizins#index'

end

