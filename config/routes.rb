Rails.application.routes.draw do
  resources :chatrooms do 
  	resource :chatroom_users
  	resources :messages
  end

  resources :guests
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'chatrooms#index'
  #mount ActionCable.server => '/cable'
end
