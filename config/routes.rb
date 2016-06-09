Rails.application.routes.draw do

root to: "welcome#index"

get 'show' => 'users#show'

match '/events', to: 'events#preflight', via: [:options]

namespace :api, defaults: { format: :json } do
  resources :events, only: [:create]
end

resources :registered_applications

devise_for :users, :controllers => { registrations: 'registrations' }



end
