Rails.application.routes.draw do
  devise_for :users
  root 'talks#index'
  resources :users
post 'users/:user_id/friendships'  => 'friendships#create' , as: 'friendships_create'
get 'friendships/:id/rooms'  => 'rooms#create' , as: 'rooms_create'
get 'rooms/:id/talks'  => 'talks#show' , as: 'talks_show'
post 'rooms/:id/talks/post' => 'talks#post'

  resources :friendships
  resources :rooms
#   scope shallow_prefix: "sekret" do
#   resources :users do
#     resources :friendships, shallow: true
#   end
# end
end
