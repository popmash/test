Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/new'
  get 'groups/edit'
  get 'groups/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  get 'search' => 'searches#search'
  resources :chats, only: [:show, :create]
  
  resources :groups, only: [:create, :show, :edit, :new, :index, :update, :destroy] do
    get "join" => 'groups#join'
     get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end