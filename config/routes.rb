Rails.application.routes.draw do
  devise_for :users
  root  'tweets#index'
  # devise_for :users
  # get 'tweets' => 'tweets#index'
  # get   'tweets/new'  =>  'tweets#new'
  # post  'tweets'      =>  'tweets#create'
  resources :tweets, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
  resources :comments, only: [:create]
  end

  resources :users, only: [:show]

  get '/timeline' => 'tweets#timeline'

end